<?php

namespace App\Http\Controllers\adminpnlx;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use App\Models\Festival;
use App\Models\FestivalDescription;
use App\Models\Temple;
use App\Models\FestivalTemple;
use App\Models\Language;
use App\Models\Faq;
use App\Models\FestivalFaq;
use App\Models\State;
use App\Models\Reminder;
use Redirect, Session, Auth, Config;

class FestivalController extends Controller
{
    public $model = 'festivals';

    public function __construct()
    {
        parent::__construct();
        $this->middleware(function ($request, $next) {
            $this->user = Auth::guard('admin')->user();
            return $next($request);
        });
        View()->share('model', $this->model);
    }

    public function index(Request $request)
    {
        $DB = Festival::query();
        $DB->where('is_deleted', 0);

        $searchVariable = array();
        $inputGet = $request->all();

        if ($request->all()) {
            $searchData = $request->all();
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

            foreach ($searchData as $fieldName => $fieldValue) {
                if ($fieldValue != "") {
                    if ($fieldName == "name") {
                        $DB->where("name", 'like', '%' . $fieldValue . '%');
                    }
                    if ($fieldName == "is_active") {
                        $DB->where("is_active", $fieldValue);
                    }
                }
                $searchVariable = array_merge($searchVariable, array($fieldName => $fieldValue));
            }
        }

        $sortBy = ($request->input('sortBy')) ? $request->input('sortBy') : 'id';
        $order = ($request->input('order')) ? $request->input('order') : 'DESC';

        $records_per_page = (Config::get('Reading.record_per_page')) ? Config::get('Reading.record_per_page') : 10;
        $results = $DB->orderBy($sortBy, $order)->paginate($records_per_page);

        $complete_string = $request->query();
        unset($complete_string["sortBy"]);
        unset($complete_string["order"]);
        $query_string = http_build_query($complete_string);
        $results->appends($inputGet);

        $statesList = \App\Models\State::pluck('name', 'id')->toArray();

        return View("admin.$this->model.index", compact('results', 'searchVariable', 'sortBy', 'order', 'query_string', 'statesList'));
    }

    public function create()
    {
        $languages = Language::where('is_active', 1)->get();
        $language_code = Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
        $states = State::get();
        $temples = Temple::where('is_active', 1)->where('is_deleted', 0)->get();
        return View("admin.$this->model.add", compact('languages', 'language_code', 'states', 'temples'));
    }

    public function Save(Request $request)
    {
        if ($request->isMethod('POST')) {
            $thisData = $request->all();

            $language_code = Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
            $dafaultLanguageArray = $thisData['data'][$language_code];

            // ✅ Detailed File Logging
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                \Log::info('FestivalController@Save: received image', [
                    'original_name' => $file->getClientOriginalName(),
                    'mime_type' => $file->getMimeType(),
                    'size' => $file->getSize(),
                    'extension' => $file->getClientOriginalExtension(),
                ]);
            } else {
                \Log::info('FestivalController@Save: no image');
            }

            $validator = Validator::make(
                [
                    'name'  => $dafaultLanguageArray['name'] ?? '',
                    'image' => $request->file('image'),
                ],
                [
                    'name'  => 'required',
                    'image' => 'nullable|mimes:jpeg,png,jpg,gif,webp|mimetypes:image/jpeg,image/png,image/jpg,image/gif,image/webp|max:20480',
                ]
            );

            if ($validator->fails()) {
                \Log::warning('FestivalController@Save: validation failed', ['errors' => $validator->errors()->toArray()]);
                return Redirect::back()->withErrors($validator)->withInput();
            } else {
                $festival = new Festival;
                $festival->date = $request->input('date');
                $festival->name = $dafaultLanguageArray['name'] ?? '';
                $festival->short_dec = $dafaultLanguageArray['short_desc'] ?? '';
                $festival->long_dec = $dafaultLanguageArray['long_desc'] ?? '';
                $festival->regional_names = $dafaultLanguageArray['regional_names'] ?? '';
                $festival->description = $dafaultLanguageArray['long_desc'] ?? '';
                $festival->states = $request->input('states');
                $festival->duration = $dafaultLanguageArray['duration'] ?? '';
                $festival->daily_significance = $dafaultLanguageArray['daily_significance'] ?? '';
                $festival->history = $dafaultLanguageArray['history'] ?? '';
                $festival->temples_to_visit = $dafaultLanguageArray['temples_to_visit'] ?? '';
                $festival->other_info = $dafaultLanguageArray['other_info'] ?? '';

                if ($request->hasFile('image')) {
                    \Log::info('FestivalController@Save: uploading to Cloudinary');
                    try {
                        $uploadedFileUrl = cloudinary()->upload($request->file('image')->getRealPath())->getSecurePath();
                        $festival->image = $uploadedFileUrl;
                        \Log::info('FestivalController@Save: uploaded', ['url' => $uploadedFileUrl]);
                    } catch (\Exception $e) {
                        \Log::error('FestivalController@Save: failed', ['error' => $e->getMessage()]);
                        Session()->flash('error', trans("Cloudinary upload failed: " . $e->getMessage()));
                        return Redirect()->back()->withInput();
                    }
                }

                $SavedResponse = $festival->save();
                $lastId = $festival->id;

                if (!empty($thisData['data'])) {
                    foreach ($thisData['data'] as $language_id => $value) {
                        $subObj = new FestivalDescription();
                        $subObj->language_id = $language_id;
                        $subObj->parent_id = $lastId;
                        $subObj->name = $value['name'] ?? '';
                        $subObj->description = $value['short_desc'] ?? '';
                        $subObj->long_description = $value['long_desc'] ?? '';
                        $subObj->regional_names = $value['regional_names'] ?? '';
                        $subObj->duration = $value['duration'] ?? '';
                        $subObj->daily_significance = $value['daily_significance'] ?? '';
                        $subObj->history = $value['history'] ?? '';
                        $subObj->temples_to_visit = $value['temples_to_visit'] ?? '';
                        $subObj->other_info = $value['other_info'] ?? '';
                        $subObj->save();
                    }
                }

                if (!$SavedResponse) {
                    Session()->flash('error', trans("Something went wrong."));
                    return Redirect()->back()->withInput();
                } else {
                    Session()->flash('success', ucfirst(Config('constants.FESTIVAL.FESTIVAL_TITLE') . " has been added successfully"));
                    return Redirect()->route($this->model . ".index");
                }
            }
        }
    }

    public function edit(Request $request, $enuserid = null)
    {
        $festival_id = '';
        $multiLanguage = array();
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
            $festivalDetails = Festival::find($festival_id);
            $cmsdescriptiondetl = FestivalDescription::where('parent_id', $festival_id)->get();
            if (!empty($cmsdescriptiondetl)) {
                foreach ($cmsdescriptiondetl as $description) {
                    $multiLanguage[$description->language_id]['name'] = $description->name;
                    $multiLanguage[$description->language_id]['short_desc'] = $description->description;
                    $multiLanguage[$description->language_id]['long_desc'] = $description->long_description;
                    $multiLanguage[$description->language_id]['regional_names'] = $description->regional_names;
                    $multiLanguage[$description->language_id]['duration'] = $description->duration;
                    $multiLanguage[$description->language_id]['daily_significance'] = $description->daily_significance;
                    $multiLanguage[$description->language_id]['history'] = $description->history;
                    $multiLanguage[$description->language_id]['temples_to_visit'] = $description->temples_to_visit;
                    $multiLanguage[$description->language_id]['other_info'] = $description->other_info;
                }
            }
            $languages = Language::where('is_active', 1)->get();
            $language_code = Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
            $states = State::get();
            $temples = Temple::where('is_active', 1)->where('is_deleted', 0)->get();
            return View("admin.$this->model.edit", compact('multiLanguage', 'cmsdescriptiondetl', 'festivalDetails', 'languages', 'language_code', 'states', 'temples'));
        } else {
            return Redirect()->route($this->model . ".index");
        }
    }

    public function update(Request $request, $enuserid = null)
    {
        if (empty($enuserid)) {
            Session()->flash('error', trans("Invalid festival ID."));
            return Redirect()->back();
        }

        $festival_id = base64_decode($enuserid);
        $thisData = $request->all();

        $language_code = Config('constants.DEFAULT_LANGUAGE.LANGUAGE_CODE');
        $dafaultLanguageArray = $thisData['data'][$language_code];

        // ✅ Detailed File Logging
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            \Log::info('FestivalController@update: received image', [
                'original_name' => $file->getClientOriginalName(),
                'mime_type' => $file->getMimeType(),
                'size' => $file->getSize(),
                'extension' => $file->getClientOriginalExtension(),
            ]);
        }

        $validator = Validator::make(
            [
                'name'  => $dafaultLanguageArray['name'] ?? '',
                'image' => $request->file('image'),
            ],
            [
                'name'  => 'required',
                'image' => 'nullable|mimes:jpeg,png,jpg,gif,webp|mimetypes:image/jpeg,image/png,image/jpg,image/gif,image/webp|max:20480',
            ]
        );

        if ($validator->fails()) {
            \Log::warning('FestivalController@update: validation failed', ['errors' => $validator->errors()->toArray()]);
            return Redirect::back()->withErrors($validator)->withInput();
        }

        $festival = Festival::where("id", $festival_id)->first();
        if (!$festival) {
            Session()->flash('error', trans("Festival not found."));
            return Redirect()->back();
        }

        $festival->date = $request->input('date');
        $festival->name = $dafaultLanguageArray['name'] ?? '';
        $festival->regional_names = $dafaultLanguageArray['regional_names'] ?? '';
        $festival->description = $dafaultLanguageArray['long_desc'] ?? '';
        $festival->states = $request->input('states');
        if (!empty($request->temple_id)) {
            $festival->temple_id = json_encode($request->input('temple_id'));
        }
        $festival->short_dec = $dafaultLanguageArray['short_desc'] ?? '';
        $festival->long_dec = $dafaultLanguageArray['long_desc'] ?? '';
        $festival->duration = $dafaultLanguageArray['duration'] ?? '';
        $festival->daily_significance = $dafaultLanguageArray['daily_significance'] ?? '';
        $festival->history = $dafaultLanguageArray['history'] ?? '';
        $festival->temples_to_visit = $dafaultLanguageArray['temples_to_visit'] ?? '';
        $festival->other_info = $dafaultLanguageArray['other_info'] ?? '';

        if ($request->hasFile('image')) {
            \Log::info('FestivalController@update: uploading to Cloudinary');
            try {
                $uploadedFileUrl = cloudinary()->upload($request->file('image')->getRealPath())->getSecurePath();
                $festival->image = $uploadedFileUrl;
                \Log::info('FestivalController@update: uploaded', ['url' => $uploadedFileUrl]);
            } catch (\Exception $e) {
                \Log::error('FestivalController@update: failed', ['error' => $e->getMessage()]);
                Session()->flash('error', trans("Cloudinary upload failed: " . $e->getMessage()));
                return Redirect()->back()->withInput();
            }
        }

        $SavedResponse = $festival->save();
        $lastId = $festival->id;

        FestivalDescription::where("parent_id", $lastId)->delete();
        if (!empty($thisData['data'])) {
            foreach ($thisData['data'] as $language_id => $value) {
                $subObj = new FestivalDescription();
                $subObj->language_id = $language_id;
                $subObj->parent_id = $lastId;
                $subObj->name = $value['name'] ?? '';
                $subObj->description = $value['short_desc'] ?? '';
                $subObj->long_description = $value['long_desc'] ?? '';
                $subObj->regional_names = $value['regional_names'] ?? '';
                $subObj->duration = $value['duration'] ?? '';
                $subObj->daily_significance = $value['daily_significance'] ?? '';
                $subObj->history = $value['history'] ?? '';
                $subObj->temples_to_visit = $value['temples_to_visit'] ?? '';
                $subObj->other_info = $value['other_info'] ?? '';
                $subObj->save();
            }
        }

        if (!$SavedResponse) {
            Session()->flash('error', trans("Something went wrong."));
            return Redirect()->back()->withInput();
        } else {
            Session()->flash('success', ucfirst(Config('constants.FESTIVAL.FESTIVAL_TITLE') . " has been updated successfully"));
            return Redirect()->route($this->model . ".index");
        }
    }

    public function view($enuserid = null)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
        } else {
            return redirect()->route($this->model . ".index");
        }
        $festivalDetails = Festival::where('id', $festival_id)->first();
        return View("admin.$this->model.view", compact('festivalDetails'));
    }

    public function destroy($enuserid)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
        }
        $userDetails = Festival::find($festival_id);
        if (empty($userDetails)) {
            return Redirect()->route($this->model . '.index');
        }
        if ($festival_id) {
            Festival::where('id', $festival_id)->update(array('is_deleted' => 1));
            Session()->flash('flash_notice', trans(ucfirst("Festival has been removed successfully")));
        }
        return back();
    }

    public function festivalTemples($enuserid = null)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
        } else {
            return redirect()->route($this->model . ".index");
        }
        $results = FestivalTemple::where('festival_id', $festival_id)->with('temple')->get();
        return View("admin.$this->model.festival_temples", compact('results', 'festival_id'));
    }

    public function festivalFaqs($enuserid = null)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
        } else {
            return redirect()->route($this->model . ".index");
        }
        $results = FestivalFaq::where('festival_id', $festival_id)->get();
        return View("admin.$this->model.festival_faqs", compact('results', 'festival_id'));
    }

    public function festivalTempleCreate($enuserid = null)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
        } else {
            return redirect()->route($this->model . ".index");
        }
        $temples = Temple::where('is_active', 1)->where('is_deleted', 0)->get();
        return View("admin.$this->model.festival_temple_add", compact('festival_id', 'temples'));
    }

    public function festivalTempleSave(Request $request, $enuserid = null)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
            $validator = Validator::make(
                array('temple_id' => $request->temple_id),
                array('temple_id' => 'required')
            );
            if ($validator->fails()) {
                return Redirect::back()->withErrors($validator)->withInput();
            } else {
                $obj = new FestivalTemple;
                $obj->festival_id = $festival_id;
                $obj->temple_id = $request->temple_id;
                $SavedResponse = $obj->save();
                if (!$SavedResponse) {
                    Session()->flash('error', trans("Something went wrong."));
                    return Redirect()->back()->withInput();
                } else {
                    Session()->flash('success', ucfirst("Temple has been added successfully"));
                    return Redirect()->route("festivals.festivalTemples", base64_encode($festival_id));
                }
            }
        }
    }

    public function festivalTempleDestroy($enuserid)
    {
        $festival_id = '';
        if (!empty($enuserid)) {
            $festival_id = base64_decode($enuserid);
            $userDetails = FestivalTemple::find($festival_id);
            if (empty($userDetails)) {
                return Redirect()->route($this->model . '.index');
            }
            if ($festival_id) {
                FestivalTemple::where('id', $festival_id)->delete();
                Session()->flash('flash_notice', trans(ucfirst("Festival Temple has been removed successfully")));
            }
            return back();
        }
    }

    public function debugUpload()
    {
        echo "<h1>Environment Debug</h1>";
        echo "upload_max_filesize: " . ini_get('upload_max_filesize') . "<br>";
        echo "post_max_size: " . ini_get('post_max_size') . "<br>";
        echo "memory_limit: " . ini_get('memory_limit') . "<br>";

        echo "<h1>Cloudinary Config Check</h1>";
        try {
            echo "Cloudinary URL present: " . (env('CLOUDINARY_URL') ? 'Yes' : 'No') . "<br>";
        } catch (\Exception $e) {
            echo "Cloudinary Error: " . $e->getMessage() . "<br>";
        }
        exit;
    }

    public function runReminders()
    {
        // Aggressive mode: fetch all unsent reminders regardless of date/time
        $reminders = \App\Models\Reminder::with(['user', 'festival'])
            ->where('sent', 0)
            ->whereHas('user', function($query) {
                $query->where('is_active', 1)->where('is_deleted', 0);
            })
            ->whereHas('festival', function($query) {
                $query->where('is_active', 1);
            })
            ->get();

        if ($reminders->isEmpty()) {
            return "<h1>No pending reminders found</h1><p>Sabhi reminders pehlay hi bhejay ja chukay hain (sent=1). Naya reminder lagao app mein phir check karo.</p><br><a href='".route('festivals.index')."'>Back to Festivals</a>";
        }

        $sentCount = 0;
        foreach ($reminders as $reminder) {
            $user = $reminder->user;
            $festival = $reminder->festival;

            // Get user's device tokens
            $deviceTokens = \App\Models\UserDeviceToken::where('user_id', $user->id)
                ->whereNotNull('device_id')
                ->where('device_id', '!=', '')
                ->get();

            if ($deviceTokens->isEmpty()) {
                \Log::info("runReminders: No device token for user " . $user->id);
                continue;
            }

            $title = "⏰ Reminder: " . ($festival->name ?? 'Festival');
            $body = "Your reminder for " . ($festival->name ?? 'Festival') . " is here!";

            // Store in DB
            \App\Models\Notification::create([
                'user_id' => $user->id,
                'title' => $title,
                'description' => $body,
                'is_read' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            $allSuccess = true;
            foreach ($deviceTokens as $deviceToken) {
                $pushResult = $this->send_push_notification(
                    $deviceToken->device_id,
                    '', 
                    $body,
                    $title,
                    'reminder',
                    [
                        'festival_id' => $festival->id,
                        'reminder_id' => $reminder->id,
                        'type' => 'reminder',
                    ]
                );
                
                // Check if result contains error
                if (isset($pushResult['response']) && strpos($pushResult['response'], '"error"') !== false) {
                    $allSuccess = false;
                    \Log::error("runReminders: Push failed for token {$deviceToken->device_id}: " . $pushResult['response']);
                }
            }

            // Only mark as sent if at least one token worked or if there was no catastrophic error
            if ($allSuccess) {
                $reminder->sent = 1;
                $reminder->save();
                $sentCount++;
            } else {
                \Log::warning("runReminders: Failed to send for reminder ID {$reminder->id}");
            }
        }

        if ($sentCount == 0) {
            return "<h1>Push Failed</h1><p>Failed to send notifications. This is usually due to an Invalid Firebase Key (Invalid JWT Signature). Please generate a new service account key in Firebase and upload it.</p><br><a href='".route('festivals.index')."'>Back to Festivals</a>";
        }

        return "<h1>Success!</h1><p>Sent $sentCount reminders immediately.</p><br><a href='".route('festivals.index')."'>Back to Festivals</a>";
    }

    public function testPushDirect() {
        try {
            $tokenData = \DB::table('user_device_token')->first();
            if (!$tokenData) return "No device tokens found in database.";
            
            $token = $tokenData->device_id;
            $title = "Test Direct";
            $body = "Checking raw FCM response";
            
            $result = $this->send_push_notification($token, "", $body, $title, "test");
            
            return "<h3>Testing Token: $token</h3><pre>" . print_r($result, true) . "</pre>";
        } catch (\Throwable $e) {
            return "<h3>500 Error Captured:</h3><p>" . $e->getMessage() . " in " . $e->getFile() . ":" . $e->getLine() . "</p><pre>" . $e->getTraceAsString() . "</pre>";
        }
    }
}
