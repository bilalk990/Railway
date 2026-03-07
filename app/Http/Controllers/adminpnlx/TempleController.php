<?php

namespace App\Http\Controllers\adminpnlx;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Config;
use App\Models\Temple;
use App\Models\TempleDescription;
use App\Models\Language;
use Carbon\Carbon;
use Redirect,Session;

class TempleController extends Controller
{
    public $model      =   'temples';
    public $sectionNameSingular      =   'temples';
    public function __construct(Request $request)
    {   
        parent::__construct();
        View()->share('model', $this->model);
        View()->share('sectionNameSingular', $this->sectionNameSingular);
        $this->request = $request;
    }
    public function index(Request $request)
    {
        $DB					=	Temple::query();
        $searchVariable		=	array();
        $inputGet			=	$request->all();
        if ($request->all()) {
            $searchData			=	$request->all();
            unset($searchData['display']);
            unset($searchData['_token']);

            if (isset($searchData['order'])) {
                unset($searchData['order']);
            }
            if (isset($searchData['sortBy'])) {
                unset($searchData['sortBy']);
            }
            if (isset($searchData['page'])) {
                unset($searchData['page']);
            }
            if ((!empty($searchData['date_from'])) && (!empty($searchData['date_to']))) {
                $dateS = date("Y-m-d",strtotime($searchData['date_from']));
                $dateE =  date("Y-m-d",strtotime($searchData['date_to']));
                $DB->whereBetween('temples.created_at', [$dateS . " 00:00:00", $dateE . " 23:59:59"]);
            } elseif (!empty($searchData['date_from'])) {
                $dateS = $searchData['date_from'];
                $DB->where('temples.created_at', '>=', [$dateS . " 00:00:00"]);
            } elseif (!empty($searchData['date_to'])) {
                $dateE = $searchData['date_to'];
                $DB->where('temples.created_at', '<=', [$dateE . " 00:00:00"]);
            }
            foreach ($searchData as $fieldName => $fieldValue) {
                if ($fieldValue != "") {
                    if ($fieldName == "name") {
                        $DB->where("temples.name", 'like', '%' . $fieldValue . '%');
                    }
                    
                }
                $searchVariable	=	array_merge($searchVariable, array($fieldName => $fieldValue));
            }
        }

        $DB->where("temples.is_deleted", 0);
        $sortBy = ($request->input('sortBy')) ? $request->input('sortBy') : 'temples.created_at';
        $order  = ($request->input('order')) ? $request->input('order')   : 'DESC';
        $records_per_page	=	($request->input('per_page')) ? $request->input('per_page') : Config::get("Reading.records_per_page");
        $results = $DB->orderBy($sortBy, $order)->paginate($records_per_page);
        $complete_string		=	$request->query();
        unset($complete_string["sortBy"]);
        unset($complete_string["order"]);
        $query_string			=	http_build_query($complete_string);
        $results->appends($inputGet)->render();
        $resultcount = $results->count();
        return  View("admin.$this->model.index", compact('resultcount', 'results', 'searchVariable', 'sortBy', 'order', 'query_string'));
    }
    public function create(Request $request)
    {       
        
        $languages = Language::where('is_active', 1)->get();
        $language_code = Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
        return  View("admin.$this->model.add",compact('languages', 'language_code'));
    }
    public function Save(Request $request){
        if ($request->isMethod('POST')) {
            $thisData = $request->all();
            $language_code              =    Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
            $dafaultLanguageArray       =    $thisData['data'][$language_code];
            
            \Log::info('TempleController@Save: start', ['data' => $thisData]);
        
            // ✅ Detailed File Logging
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                \Log::info('TempleController@Save: received image', [
                    'original_name' => $file->getClientOriginalName(),
                    'mime_type' => $file->getMimeType(),
                    'size' => $file->getSize(),
                    'extension' => $file->getClientOriginalExtension(),
                ]);
            }

            $validator = Validator::make(
                array(
                    'name'  => $dafaultLanguageArray['name'] ?? '',
                    'url'   => "required",
                    'image' => $request->file('image'),
                ),
                array(
                    'name'  => 'required',
                    'url'   => "required",
                    'image' => 'required|mimes:jpeg,png,jpg,gif,webp|mimetypes:image/jpeg,image/png,image/jpg,image/gif,image/webp|max:20480',
                )
            );
            
            if ($validator->fails()) {
                \Log::warning('TempleController@Save: validation failed', ['errors' => $validator->errors()->toArray()]);
                return Redirect::back()->withErrors($validator)->withInput();
            }else{
                $temple                               =   new Temple;
                $temple->url                          =   $request->input('url');
                $temple->name                         =   $dafaultLanguageArray['name'] ?? '';
                if ($request->hasFile('image')) {
                    \Log::info('TempleController@Save: uploading image to Cloudinary');
                    try {
                        $uploadedFileUrl = cloudinary()->upload($request->file('image')->getRealPath())->getSecurePath();
                        $temple->image = $uploadedFileUrl;
                        \Log::info('TempleController@Save: image uploaded', ['url' => $uploadedFileUrl]);
                    } catch (\Exception $e) {
                        \Log::error('TempleController@Save: Cloudinary upload failed', ['error' => $e->getMessage()]);
                        Session()->flash('error', trans("Cloudinary upload failed: " . $e->getMessage()));
                        return Redirect()->back()->withInput();
                    }
                }
                $SavedResponse = $temple->save();
                $lastId = $temple->id;
                if (!empty($thisData)) {
                    foreach ($thisData['data'] as $language_id => $value) {
                        $subObj                 = new TempleDescription();
                        $subObj->language_id    = $language_id;
                        $subObj->parent_id      = $lastId;
                        $subObj->name           = $value['name'];
                        $subObj->save();
                    }
                }

                
                if (!$SavedResponse) {
                    Session()->flash('error', trans("Something went wrong."));
                    return Redirect()->back()->withInput();
                } else {
                    Session()->flash('success', ucfirst(Config('constants.TEMPLE.TEMPLE_TITLE')." has been added successfully"));
                    return Redirect()->route($this->model . ".index");
                }
            }
        } 
    }
     public function edit(Request $request,  $enuserid = null)
    { 
        $temple_id = '';
        $multiLanguage =    array();
        if (!empty($enuserid)) {
            $temple_id = base64_decode($enuserid);
            $templeDetails         =   Temple::find($temple_id);
            $cmsdescriptiondetl = TempleDescription::where('parent_id', $temple_id)->get();
            if (!empty($cmsdescriptiondetl)) {
                foreach ($cmsdescriptiondetl as $description) {
                    $multiLanguage[$description->language_id]['name']    =    $description->name;
                }
            }
            $languages = Language::where('is_active', 1)->get();
            $language_code = Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
            return View("admin.$this->model.edit", compact('multiLanguage', 'cmsdescriptiondetl', 'templeDetails', 'languages', 'language_code'));

        }else{
            return Redirect()->route($this->model . ".index");
        }
    }
    public function update(Request $request,  $enuserid = null){
        $temple_id = '';
        $multiLanguage =    array();
        if (!empty($enuserid)) {
           $temple_id = base64_decode($enuserid);
            $thisData                    =    $request->all();
            
            $default_language            =    Config('constants.DEFAULT_LANGUAGE.FOLDER_CODE');
            $language_code                 =   Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
            $dafaultLanguageArray        =    $thisData['data'][$language_code];
            // ✅ Detailed File Logging
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                \Log::info('TempleController@update: received image', [
                    'original_name' => $file->getClientOriginalName(),
                    'mime_type' => $file->getMimeType(),
                    'size' => $file->getSize(),
                    'extension' => $file->getClientOriginalExtension(),
                ]);
            }

            $validator = Validator::make(
                array(
                  'name'  => $dafaultLanguageArray['name'] ?? '',
                  'url'   => "required",
                  'image' => $request->file('image'),
                ),
                array(
                   'name'  => 'required',
                   'url'   => "required",
                   'image' => 'nullable|mimes:jpeg,png,jpg,gif,webp|mimetypes:image/jpeg,image/png,image/jpg,image/gif,image/webp|max:20480',
                )
            );
            if ($validator->fails()) {
                \Log::warning('TempleController@update: validation failed', ['errors' => $validator->errors()->toArray()]);
                return redirect()->back()->withErrors($validator)->withInput();
            }else{
                 $temple                               =   Temple::where("id",$temple_id)->first();
                $temple->name                         =   $dafaultLanguageArray['name'] ?? '';
                $temple->url                         =   $request->url;
                 
               if ($request->hasFile('image')) {
                    \Log::info('TempleController@update: uploading image to Cloudinary');
                    try {
                        $uploadedFileUrl = cloudinary()->upload($request->file('image')->getRealPath())->getSecurePath();
                        $temple->image = $uploadedFileUrl;
                        \Log::info('TempleController@update: image uploaded', ['url' => $uploadedFileUrl]);
                    } catch (\Exception $e) {
                        \Log::error('TempleController@update: Cloudinary upload failed', ['error' => $e->getMessage()]);
                        Session()->flash('error', trans("Cloudinary upload failed: " . $e->getMessage()));
                        return Redirect()->back()->withInput();
                    }
                }
                $SavedResponse = $temple->save();
                $lastId = $temple->id;
                 TempleDescription::where("parent_id", $lastId)->delete();
                if (!empty($thisData)) {
                    foreach ($thisData['data'] as $language_id => $value) {
                        $subObj                =    new TempleDescription();
                        $subObj->language_id    = $language_id;
                        $subObj->parent_id      = $lastId;
                        $subObj->name           = $value['name'];
                        $subObj->save();
                    }
                }
                 if (!$SavedResponse) {
                    Session()->flash('error', trans("Something went wrong."));
                    return Redirect()->back()->withInput();
                } else {
                    Session()->flash('success', ucfirst(Config('constants.TEMPLE.TEMPLE_TITLE')." has been updated successfully"));
                    return Redirect()->route($this->model . ".index");
                }
            }
            
        }
       
    }
    public function destroy( $enuserid)
    {
        $temple_id = '';
        if (!empty($enuserid)) {
            $temple_id = base64_decode($enuserid);
        }
        $userDetails   =   Temple::find($temple_id);
        if (empty($userDetails)) {
            return Redirect()->route($this->model . '.index');
        }
        if ($temple_id) {

            Temple::where('id', $temple_id)->update(array(
                'is_deleted'    => 1, 
            ));

            Session()->flash('flash_notice', trans(ucfirst( "Temple has been removed successfully")));
        }
        return back();
    }
    public function changeStatus($modelId = 0, $status = 0)
    {
        if ($status == 1) {
            $statusMessage   =   trans(Config('constants.TEMPLE.TEMPLE_TITLE'). " has been deactivated successfully");
        } else {
            $statusMessage   =   trans(Config('constants.TEMPLE.TEMPLE_TITLE'). " has been activated successfully");
        }
        $temple = Temple::find($modelId);
        if ($temple) {
            $currentStatus = $temple->is_active;
            if (isset($currentStatus) && $currentStatus == 0) {
                $NewStatus = 1;
            } else {
                $NewStatus = 0;
            }
            $temple->is_active = $NewStatus;
            $ResponseStatus = $temple->save();
        }
        Session()->flash('flash_notice', $statusMessage);
        return back();
    }
   
    public function view($enuserid = null)
    {
        $temple_id = '';
        if (!empty($enuserid)) {
            $temple_id = base64_decode($enuserid);
        } else {
            return redirect()->route($this->model . ".index");
        }
        $templeDetails    =    Temple::where('id', $temple_id)->first();
        return  View("admin.$this->model.view", compact('templeDetails'));
    }
       
}
