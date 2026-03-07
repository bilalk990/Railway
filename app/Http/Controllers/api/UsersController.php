<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use App\Models\State;
use Config;
use App\Models\Lookup;  
use App\Models\User;
use App\Models\UserDeviceToken;
use App\Models\Cms;
use Carbon\Carbon;
use App\Models\EmailAction;
use App\Models\EmailTemplate;
use App\Models\Temple;
use App\Models\Festival;
use App\Models\Faq;
use App\Models\FestivalFaq;
use App\Models\NotificationSetting;
use App\Models\Notification;
use App\Models\FestivalTemple;
use GuzzleHttp\Client;
use App\Models\Reminder;
use Redirect,Session,Auth;
use App\Models\Tiptap;

class UsersController extends Controller
{
    
    public function cms($type){
        
        $cms        = Cms::where('slug',$type)->with('cmsDesc')->first();
                $response                    =    array();
                $response["status"]            =    "success";
                $response["data"]            =    $cms;
                $response["msg"]            =    trans("");
                return response()->json($response, 200);
            
    }
    
    public function faqs(){
         $faqs        = Faq::with('faqDesc')->get();
                $response                    =    array();
                $response["status"]            =    "success";
                $response["data"]            =    $faqs;
                $response["msg"]            =    trans("");
                return response()->json($response, 200);
    }


public function signup(Request $request)
{
    $formData = $request->all();
    if (!empty($formData)) {

        $validator = Validator::make(
            $request->all(),
            [
                'name'         => 'required',
                'email'        => 'required|email|unique:users,email',
                'phone_number' => 'required',
            ],
            [
                "name.required"         => trans("The full name field is required"),
                "email.required"        => trans("The email field is required"),
                "email.email"           => trans("The email must be type of email"),
                "email.unique"          => trans("The email entered is already registered"),
                "phone_number.required" => trans("The phone number field is required"),
            ]
        );

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()]);
        } else {
            $obj = new User;
            $obj->name               = $request->input('name');
            $obj->email              = $request->input('email');
            $obj->phone_prefix       = $request->input('phone_prefix');
            $obj->phone_country_code = $request->input('phone_country_code');
            $obj->phone_number       = $request->input('phone_number');
            $obj->country            = $request->input('country');
            $obj->state              = $request->input('state');
            $obj->language           = $request->input('language');
            $obj->notify             = $request->input('notify');

         
            $obj->is_verified = 1;

            $obj->save();

        //    if ($request->device_type && $request->device_id) {
                UserDeviceToken::create([
                    'user_id'     => $obj->id,
                    'device_type' => $request->device_type,
                    'device_id'   => $request->device_id
                ]);
            // }

            
            $token = $obj->createToken('API Token')->accessToken;

            
            $user = User::find($obj->id);

            return response()->json([
                'status'  => 'success',
                'message' => trans('Signup successful, you are now logged in'),
                'token'   => $token,
                'user'    => $user
            ]);
        }
    } else {
        return response()->json(['msg' => trans('Something went wrong, please try again')]);
    }
}


    public function getVerificationCode(){
    	return 1234;
    }
    
    public function check_verification_token(Request $request, $validate_string)
	{
		$userInfo = User::where('forgot_password_validate_string', $validate_string)->first();
		if (empty($userInfo)) {
			$response["status"]		=	"error";
			$response["msg"]		=	trans("Invalid validate string");
			$response["data"]		=	(object)array();
			return json_encode($response);
		}
		$formData		=	$request->all();
		$response		=	array();
		if (!empty($formData)) {
			$request->replace($this->arrayStripTags($request->all()));
			$validator = Validator::make(
				$request->all(),
				array(
					'verification_code' => 'required',
				),
				array(
					"verification_code.required" => trans("The verification code field is required"),
				)
			);
			if ($validator->fails()) {
				$response		=	$this->change_error_msg_layout($validator->errors()->getMessages());
			} else {
				$currentTime	=	date("Y-m-d H:i:s");
				$users			=	User::where("forgot_password_validate_string", $validate_string)
					->where("verification_code", $request->input("verification_code"))
					->select("id")
					->first();
				if (!empty($users)) {
					User::where("id", $users->id)->update(array("verification_code" => NULL, "forgot_password_validate_string" => "", "is_verified" => 1));
					if (!empty($request->input('device_token'))) {
						User::where('id', $users->id)->update(['device_token' => $request->input('device_token'), 'device_type' => $request->input('device_type')]);
					}
					$user_details			=	User::where("id", $users->id)->first();
					$user_details->profile_link	= $user_details->profile_link;
					$token        			=	$user_details->createToken('Reymend Personal Access Client')->accessToken;
					$response["status"]		=	"success";
					$response["msg"]		=	trans("Your profile has been created successfully");
					$response["data"]		=	$user_details;
					$response["type"]		= 	'login';
					$response["token"]		=	$token;
					$userToken 				=   UserDeviceToken::where('user_id', $user_details->id)->first();
					// $this->send_push_notification($userToken->device_id,$userToken->device_type,"Resgistered Successfully",'registered',$user_details,'Registered User');
					return json_encode($response);
				} else {
					$response["status"]		=	"error";
					$response["msg"]		=	trans("Invalid verification code");
					$response["data"]		=	(object)array();
					return json_encode($response);
				}
			}
		} else {
			$response["status"]		=	"error";
			$response["msg"]		=	trans("Invalid request");
			$response["data"]		=	(object)array();
			return json_encode($response);
		}
		return json_encode($response);
	}


public function login(Request $request)
{
    $response = [];

    $validator = Validator::make(
        $request->all(),
        [
            'email' => 'required|email',
        ],
        [
            "email.required" => "The email field is required",
            "email.email"    => "The email must be a valid email address",
        ]
    );

    if ($validator->fails()) {
        $response = $this->change_error_msg_layout($validator->errors()->getMessages());
    } else {
        $email = $request->input("email");
        $user_details = User::where("email", $email)->first();

        if ($user_details) {
        
            Auth::loginUsingId($user_details->id);
            $user_details = User::find($user_details->id);

            $token = $user_details->createToken('DirectLoginToken')->accessToken;
 if ($request->device_type && $request->device_id) {
                $deviceToken = UserDeviceToken::where('user_id', $user_details->id)
                    ->where('device_id', $request->device_id)
                    ->first();

                if ($deviceToken) {
                    // Update existing device token
                    $deviceToken->update([
                        'device_type' => $request->device_type,
                        'device_id'   => $request->device_id,
                        'updated_at'  => now()
                    ]);
                } else {
                    // Create new device token
                    UserDeviceToken::create([
                        'user_id'     => $user_details->id,
                        'device_type' => $request->device_type,
                        'device_id'   => $request->device_id
                    ]);
                }
            }
            $response["status"]  = "success";
            $response["redirect"]  = "redirect_Home";
            $response["msg"]     = "You are now logged in";
            $response["data"]    = $user_details;
            $response["token"]   = $token;

        } else {
        
            $response["status"]      = "success";
               $response["redirect"]  = "redirect_signup";
            $response["msg"]         = "User not found. Please sign up.";
            $response["data"]        = (object)[];
        }
    }

    return response()->json($response);
}


    public function temples(){

         $temples        = Temple::where('is_deleted',0)->with('templeDesc')->get();
         foreach($temples as $temple){
            $temple->image      = (!empty($temple->image) && str_starts_with($temple->image, 'http')) ? $temple->image : config('constants.TEMPLE_IMAGE_PATH').$temple->image;
         }
                $response                    =    array();
                $response["status"]            =    "success";
                $response["data"]            =    $temples;
                $response["msg"]            =    trans("");
                return response()->json($response, 200);
    }



    public function festivals()
    {
        $userId = auth('api')->user()->id;

        $festivals = Festival::with(['festivalDesc'])
            ->where('is_deleted', 0)
            ->get();

        $remindersByFestivalAndDate = Reminder::where('user_id', $userId)
            ->get()
            ->groupBy(function ($item) {
                return $item->festival_id . '_' . $item->date;
            });

        $allFaqs = FestivalFaq::whereIn('festival_id', $festivals->pluck('id'))->get()->groupBy('festival_id');

        $allTempleIds = [];
        foreach ($festivals as $festival) {
            $ids = json_decode($festival->temple_id, true);
            if (is_array($ids)) {
                $allTempleIds = array_merge($allTempleIds, $ids);
            }
        }
        $allTempleIds = array_unique(array_filter($allTempleIds));
        $allTemples = Temple::with('templeDesc')->whereIn('id', $allTempleIds)->where('is_deleted', 0)->get()->keyBy('id');

        $finalFestivals = collect();

        foreach ($festivals as $festival) {
            // Handle image path (Cloudinary or local)
            $festival->image = (!empty($festival->image) && str_starts_with($festival->image, 'http')) 
                ? $festival->image 
                : config('constants.FESTIVAL_IMAGE_PATH') . $festival->image;

            // Assign pre-fetched temples based on JSON temple_id
            $templeIds = json_decode($festival->temple_id, true);
            $festivalTemples = [];
            if (is_array($templeIds)) {
                foreach ($templeIds as $tid) {
                    if (isset($allTemples[$tid])) {
                        $temple = $allTemples[$tid];
                        $temple->image = (!empty($temple->image) && str_starts_with($temple->image, 'http')) 
                            ? $temple->image 
                            : config('constants.TEMPLE_IMAGE_PATH') . $temple->image;
                        $festivalTemples[] = clone $temple; // Clone to avoid sharing state
                    }
                }
            }
            $festival->temples = $festivalTemples;

            // Assign faqs
            $festival->faqs = $allFaqs->get($festival->id, collect());

            // Split dates and process each date as a separate festival entry
            $dates = array_map('trim', explode(',', $festival->date));
            foreach ($dates as $singleDate) {
                if (empty($singleDate)) continue;

                $festivalCopy = clone $festival;
                $festivalCopy->date = $singleDate;
                
                // Check reminder status from memory
                $key = $festival->id . '_' . $singleDate;
                $festivalCopy->is_remainder = isset($remindersByFestivalAndDate[$key]) ? 1 : 0;

                $finalFestivals->push($festivalCopy);
            }
        }

        // Sort the exploded entries by date
        $finalFestivals = $finalFestivals->sortBy(function ($festival) {
            try {
                return \Carbon\Carbon::parse($festival->date);
            } catch (\Exception $e) {
                return \Carbon\Carbon::now()->addYears(10); 
            }
        })->values();

        return response()->json([
            "status" => "success",
            "data"   => $finalFestivals,
            "msg"    => "",
        ], 200);
    }



// public function festivalstab()
// {
//     $festivals = Festival::with('faqs.faqDesc', 'temple.templeDesc', 'festivalDesc')
//         ->where('is_deleted', 0)
//         ->get();

//     $singleFestivals = collect();
//     $multipleFestivals = collect();

//     foreach ($festivals as $festival) {
//         // Festival image
//         $festival->image = config('constants.FESTIVAL_IMAGE_PATH') . $festival->image;

//         // Temple handling
//         $templeIds = json_decode($festival->temple_id, true);
//         if (is_array($templeIds) && count($templeIds) > 0) {
//             $temples = Temple::whereIn('id', $templeIds)
//                 ->where('is_deleted', 0)
//                 ->get();

//             foreach ($temples as $temple) {
//                 $temple->image = config('constants.TEMPLE_IMAGE_PATH') . $temple->image;
//             }

//             $festival->temples = $temples;
//         } else {
//             $festival->temples = [];
//         }

//         // FAQs
//         $faqs = FestivalFaq::where('festival_id', $festival->id)->get();
//         $festival->faqs = $faqs;

//         // Dates
//         $dates = array_map('trim', explode(',', $festival->date));

//         if (count($dates) === 1) {
//             // single-date festival
//             $festival->date = $dates[0];
//             $singleFestivals->push($festival);
//         } else {
//             // multi-date festival
//             $festival->date = $dates[0]; // first date as main
//             $festival->festival_dates = $dates;
//             $multipleFestivals->push($festival);
//         }
//     }

//     // Sorting both groups
//     $singleFestivals = $singleFestivals->sortBy(function ($festival) {
//         return \Carbon\Carbon::parse($festival->date);
//     })->values();

//     $multipleFestivals = $multipleFestivals->sortBy(function ($festival) {
//         return \Carbon\Carbon::parse($festival->date);
//     })->values();

//     $response = [
//         "status" => "success",
//         "data"   => [
//             "single_festivals"   => $singleFestivals,
//             "multiple_festivals" => $multipleFestivals,
//         ],
//         "msg"    => trans(""),
//     ];

//     return response()->json($response, 200);
// }


    public function festivalstab(Request $request)
    {
        $userId = auth('api')->user()->id;

        // 1. Build Query
        $festivalsQuery = Festival::with(['festivalDesc'])
            ->where('is_deleted', 0);

        if ($request->has('state_id') && !empty($request->state_id)) {
            $stateId = $request->state_id;
            $festivalsQuery->whereJsonContains('states', $stateId);
        }

        $festivals = $festivalsQuery->get();

        // 2. Fetch all user reminders at once
        $remindersByFestivalAndDate = Reminder::where('user_id', $userId)
            ->get()
            ->groupBy(function ($item) {
                return $item->festival_id . '_' . $item->date;
            });

        // 3. Fetch all FestivalFaqs at once
        $allFaqs = FestivalFaq::whereIn('festival_id', $festivals->pluck('id'))->get()->groupBy('festival_id');

        // 4. Collect unique temple IDs from JSON column to fetch them in bulk
        $allTempleIds = [];
        foreach ($festivals as $festival) {
            $ids = json_decode($festival->temple_id, true);
            if (is_array($ids)) {
                $allTempleIds = array_merge($allTempleIds, $ids);
            }
        }
        $allTempleIds = array_unique(array_filter($allTempleIds));
        $allTemples = Temple::with('templeDesc')->whereIn('id', $allTempleIds)->where('is_deleted', 0)->get()->keyBy('id');

        $singleFestivals = collect();
        $multipleFestivals = collect();

        foreach ($festivals as $festival) {
            // Handle image path (Cloudinary or local)
            $festival->image = (!empty($festival->image) && str_starts_with($festival->image, 'http')) 
                ? $festival->image 
                : config('constants.FESTIVAL_IMAGE_PATH') . $festival->image;

            // Assign pre-fetched temples
            $templeIds = json_decode($festival->temple_id, true);
            $festivalTemples = [];
            if (is_array($templeIds)) {
                foreach ($templeIds as $tid) {
                    if (isset($allTemples[$tid])) {
                        $temple = $allTemples[$tid];
                        $temple->image = (!empty($temple->image) && str_starts_with($temple->image, 'http')) 
                            ? $temple->image 
                            : config('constants.TEMPLE_IMAGE_PATH') . $temple->image;
                        $festivalTemples[] = clone $temple;
                    }
                }
            }
            $festival->temples = $festivalTemples;

            // Assign faqs
            $festival->faqs = $allFaqs->get($festival->id, collect());

            // Handle dates and categorization
            $dates = array_map('trim', explode(',', $festival->date));
            if (count($dates) === 1) {
                $festival->date = $dates[0];
                $festival->is_multiple_festival = 0; 
                
                // Check reminder for the single date
                $key = $festival->id . '_' . $dates[0];
                $festival->is_remainder = isset($remindersByFestivalAndDate[$key]) ? 1 : 0;
                
                $singleFestivals->push($festival);
            } else {
                $festival->date = $dates[0]; // first date as main
                $festival->festival_dates = $dates;
                $festival->is_multiple_festival = 1; 

                // Check reminder for the main date
                $key = $festival->id . '_' . $dates[0];
                $festival->is_remainder = isset($remindersByFestivalAndDate[$key]) ? 1 : 0;

                $multipleFestivals->push($festival);
            }
        }

        // 5. Sorting
        $singleFestivals = $singleFestivals->sortBy(function ($f) {
            try { return \Carbon\Carbon::parse($f->date); } catch (\Exception $e) { return \Carbon\Carbon::now()->addYears(10); }
        })->values();

        $multipleFestivals = $multipleFestivals->sortBy(function ($f) {
            try { return \Carbon\Carbon::parse($f->date); } catch (\Exception $e) { return \Carbon\Carbon::now()->addYears(10); }
        })->values();

        return response()->json([
            "status" => "success",
            "data"   => [
                "single_festivals"   => $singleFestivals,
                "multiple_festivals" => $multipleFestivals,
            ],
            "msg"    => "",
        ], 200);
    }


public function festivalDetail($id)
{
    $festival = Festival::where('id', $id)
        ->with(['faqs.faqDesc', 'festivalDesc'])
        ->where('is_deleted', 0)
        ->first();

    if ($festival) {
        $festival->image = (!empty($festival->image) && str_starts_with($festival->image, 'http')) ? $festival->image : config('constants.FESTIVAL_IMAGE_PATH') . $festival->image;

        // fetch temples manually through FestivalTemple
        $temples = FestivalTemple::with('temple.templeDesc')
            ->where('festival_id', $festival->id)
            ->get();
            
        foreach ($temples as $value) {
            $value->temple->image = (!empty($value->temple->image) && str_starts_with($value->temple->image, 'http')) ? $value->temple->image : config('constants.TEMPLE_IMAGE_PATH') .$value->temple->image;
        }

        $festival->temples = $temples; // attach temples into response
    }

    $response = [
        "status" => "success",
        "data"   => $festival,
        "msg"    => "",
    ];

    return response()->json($response, 200);
}


public function updateProfile(Request $request){
  $formData = $request->all();
    if (!empty($formData)) {

        $validator = Validator::make(
            $request->all(),
            [
                'name'         => 'required',
                'email'        => 'required',
                'phone_number' => 'required',
            ],
            [
                "name.required"         => trans("The full name field is required"),
                "email.required"        => trans("The email field is required"),
                "email.email"           => trans("The email must be type of email"),
                "email.unique"          => trans("The email entered is already registered"),
                "phone_number.required" => trans("The phone number field is required"),
            ]
        );

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()]);
        } else {
            $obj                     = auth('api')->user();
            $obj->name               = $request->input('name');
            $obj->email              = $request->input('email');
            $obj->phone_prefix       = $request->input('phone_prefix');
            $obj->phone_country_code = $request->input('phone_country_code');
            $obj->phone_number       = $request->input('phone_number');
            $obj->country            = $request->input('country');
            $obj->state              = $request->input('state');
            $obj->language           = $request->input('language');
            $obj->notify             = $request->input('notify');
         
           if ($request->hasFile('image')) {
                $uploadedFileUrl = cloudinary()->upload($request->file('image')->getRealPath())->getSecurePath();
                $obj->image = $uploadedFileUrl;
            }

            $obj->save();


            return response()->json([
                'status'  => 'success',
                'message' => trans('Profile updated successfully'),
                'user'    => $obj
            ]);
        }
    } else {
        return response()->json(['msg' => trans('Something went wrong, please try again')]);
    }   
}

public function deleteAccount(){
    $userId = auth('api')->user()->id;
    User::where('id', $userId)->delete();
     return response()->json([
        'status'  => 'success',
        'message' => trans('Profile deleted'),
        'user'    => null
    ]);
}

public function getPanchang(Request $request)
    {

        $postData = [
        "year" => (int)$request->year,
        "month" => (int)$request->month,
        "date" => (int)$request->date,
        "hours" => (int)$request->hours,
        "minutes" => (int)$request->minutes,
        "seconds" => (int)$request->seconds,
        "latitude" => (float)$request->lat,
        "longitude" => (float)$request->lng,
        "timezone" => (float)$request->timezone,
        "config" => [
            "observation_point" => "topocentric",
            "ayanamsha" => "lahiri"
        ]
    ];

    $curl = curl_init();

    curl_setopt_array($curl, [
        CURLOPT_URL => 'https://json.freeastrologyapi.com/tithi-durations',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => json_encode($postData),
        CURLOPT_HTTPHEADER => [
            'Content-Type: application/json',
          //  'x-api-key: Tir8k0Wi1a2hDnD60J86v4Obcgtl7mCSJmh77hg4'
             'x-api-key: ysyYvW6Nvv6CtF1q043DH92w9d6JcMfN1KVcDiu8'
           
        ],
    ]);

    $response = curl_exec($curl);
    curl_close($curl);
        
                
    $curl = curl_init();

    curl_setopt_array($curl, [
        CURLOPT_URL => 'https://json.freeastrologyapi.com/nakshatra-durations',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => json_encode($postData),
        CURLOPT_HTTPHEADER => [
            'Content-Type: application/json',
          //  'x-api-key: Tir8k0Wi1a2hDnD60J86v4Obcgtl7mCSJmh77hg4'
          'x-api-key: ysyYvW6Nvv6CtF1q043DH92w9d6JcMfN1KVcDiu8'

        ],
    ]);

    $response2 = curl_exec($curl);
    curl_close($curl);
    
    $curl = curl_init();

    curl_setopt_array($curl, [
        CURLOPT_URL => 'https://json.freeastrologyapi.com/yama-gandam',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => json_encode($postData),
        CURLOPT_HTTPHEADER => [
            'Content-Type: application/json',
           // 'x-api-key: Tir8k0Wi1a2hDnD60J86v4Obcgtl7mCSJmh77hg4'
           'x-api-key: ysyYvW6Nvv6CtF1q043DH92w9d6JcMfN1KVcDiu8'

        ],
    ]);

    $response3 = curl_exec($curl);
    curl_close($curl);

    $tithi = json_decode($response, true);
    $nakshatra = json_decode($response2, true);
    $yamaGandam = json_decode($response3, true);
    
    // Each contains "output" which is also JSON string → decode again
    $tithiOutput = isset($tithi['output']) ? json_decode($tithi['output'], true) : null;
    $nakshatraOutput = isset($nakshatra['output']) ? json_decode($nakshatra['output'], true) : null;
    $yamaGandamOutput = isset($yamaGandam['output']) ? json_decode($yamaGandam['output'], true) : null;
    
    return response()->json([
        'success' => true,
        'tithi' => $tithiOutput,
        'nakshatra' => $nakshatraOutput,
        'yama_gandam' => $yamaGandamOutput
    ]);

    }
    
    
    public function createReminder(Request $request)
    {
        $request->validate([
            'festival_id'   => 'required|integer',
            'festival_date' => 'required|string',           // can be single or CSV
            'before_days'   => 'required|integer|min:0',
            'time'          => 'nullable|date_format:H:i',
            'is_recurring'  => 'required|in:0,1'
        ]);
    
        $userId = auth('api')->user()->id;
    
        // Default time
        $reminderTime = $request->time ?? "00:00";
    
        // If recurring = 1 → festival_date is CSV list
        if ($request->is_recurring == 1) {
    
            $festival_dates         = Festival::where('id',$request->festival_id)->value('date');
            $dates = explode(',', $festival_dates); // multiple dates
          
            $createdReminders = [];
    
            foreach ($dates as $date) {
                $date = trim($date);
    
                // Skip invalid dates
                if (!strtotime($date)) {
                    continue;
                }
    
                $festivalDate = Carbon::parse($date);
    
                // Calculate reminder date = festival date - before_days
                $reminderDate = $festivalDate->copy()->subDays($request->before_days);
    
                // Combine date + time
                $reminderDateTime = Carbon::parse($reminderDate->format('Y-m-d') . " " . $reminderTime);
    
                // Save reminder
                $createdReminders[] = Reminder::create([
                    'user_id'       => $userId,
                    'festival_id'   => $request->festival_id,
                    'date'          => $reminderDate,
                    'time'          => $reminderDateTime,
                    'is_recurring'  => 1,
                ]);
            }
    
            return response()->json([
                'message' => 'Recurring reminders created successfully.',
                'data'    => $createdReminders,
            ], 201);
        }
    
        // === Non-recurring (Normal Single Reminder) ===
    
        $festivalDate = Carbon::parse($request->festival_date);
        $reminderDate = $festivalDate->copy()->subDays($request->before_days);
    
        $reminderDateTime = Carbon::parse($reminderDate->format('Y-m-d') . " " . $reminderTime);
    
        $reminder = Reminder::create([
            'user_id'      => $userId,
            'festival_id'  => $request->festival_id,
            'date'         => $reminderDate,
            'time'         => $reminderDateTime,
            'is_recurring' => 0,
        ]);
    
        return response()->json([
            'message' => 'Reminder created successfully.',
            'data'    => $reminder,
        ], 201);
    }

    
    public function getReminder(){
     $userId = auth('api')->user()->id;
        $reminders      = Reminder::where('user_id',$userId)->with('festival')->get();
        
          return response()->json([
            'message'  => 'Reminder retreived successfully.',
            'data'     => $reminders,
        ], 201);
    }
   
     public function deleteReminder($festival_id){
        
     $userId = auth('api')->user()->id;
        $reminders      = Reminder::where('id',$festival_id)->delete();
        
          return response()->json([
            'message'  => 'Reminder deleted successfully.',
            'data'     => [],
        ], 201);
    }

    public function getManageNotification()
    {
        $userId = auth('api')->user()->id;

        $settings = NotificationSetting::where('user_id', $userId)->first();

        return response()->json([
            'status' => true,
            'message' => 'Notification settings fetched successfully',
            'data' => $settings
        ]);
    }

    public function notificationsList()
    {
        $userId = auth('api')->user()->id;

        //$settings = Notification::where('user_id', $userId)->get();
        $settings = Notification::where('user_id', $userId)->get();

        return response()->json([
            'status' => true,
            'message' => 'Notification List fetched successfully',
            'data' => $settings
        ]);
    }

    public function updateManageNotification(Request $request)
    {
        $request->validate([
            'daily_panchang' => 'nullable|boolean',
            'festival_notification' => 'nullable|boolean'
        ]);
        $userId = auth('api')->user()->id;

        $settings = NotificationSetting::updateOrCreate(
            ['user_id' => $userId], // condition
            [
                'daily_panchang' => $request->daily_panchang ?? 1,
                'festival_notification' => $request->festival_notification ?? 1
            ]
        );
    
        return response()->json([
            'status' => true,
            'message' => 'Notification settings updated successfully',
            'data' => $settings
        ]);
    }
      public function tiptapIndex(Request $request)
    {
        try {
            $DB = Tiptap::query();
            $inputGet = $request->all();
            
            // Search and filter logic (same as your original)
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
                if ((!empty($searchData['date_from'])) && (!empty($searchData['date_to']))) {
                    $dateS = date("Y-m-d", strtotime($searchData['date_from']));
                    $dateE = date("Y-m-d", strtotime($searchData['date_to']));
                    $DB->whereBetween('tiptaps.created_at', [$dateS . " 00:00:00", $dateE . " 23:59:59"]);
                } elseif (!empty($searchData['date_from'])) {
                    $dateS = $searchData['date_from'];
                    $DB->where('tiptaps.created_at', '>=', [$dateS . " 00:00:00"]);
                } elseif (!empty($searchData['date_to'])) {
                    $dateE = $searchData['date_to'];
                    $DB->where('tiptaps.created_at', '<=', [$dateE . " 00:00:00"]);
                }
                
                foreach ($searchData as $fieldName => $fieldValue) {
                    if ($fieldValue != "") {
                        if ($fieldName == "title") {
                            $DB->where("tiptaps.title", 'like', '%' . $fieldValue . '%');
                        }
                    }
                }
            }

            $DB->where("tiptaps.is_deleted", 0);
            
            $sortBy = ($request->input('sortBy')) ? $request->input('sortBy') : 'tiptaps.created_at';
            $order = ($request->input('order')) ? $request->input('order') : 'DESC';
            
            // For API, you can set a default or allow per_page parameter
            $records_per_page = ($request->input('per_page')) ? $request->input('per_page') : 10;
            
            // Get paginated results
            $results = $DB->orderBy($sortBy, $order)->paginate($records_per_page);
            
            // Transform results to include full image URLs
            $transformedResults = $results->getCollection()->map(function ($item) {
                return [
                    'id' => $item->id,
                    'title' => $item->title,
                    'description' => $item->description,
                    'image' => $item->image ? Config::get('constants.TIPTAP_IMAGE_PATH') . $item->image : null,
                    'thumbnail' => $item->image ? Config::get('constants.TIPTAP_IMAGE_PATH') . $item->image : null,
                    'image_name' => $item->image,
                    'status' => $item->status,
                    'is_deleted' => $item->is_deleted,
                    'created_at' => $item->created_at ? Carbon::parse($item->created_at)->toDateTimeString() : null,
                    'updated_at' => $item->updated_at ? Carbon::parse($item->updated_at)->toDateTimeString() : null,
                ];
            });
            
            return response()->json([
                'success' => true,
                'message' => 'Tiptaps fetched successfully',
                'data' => [
                    'current_page' => $results->currentPage(),
                    'data' => $transformedResults,
                    'first_page_url' => $results->url(1),
                    'from' => $results->firstItem(),
                    'last_page' => $results->lastPage(),
                    'last_page_url' => $results->url($results->lastPage()),
                    'next_page_url' => $results->nextPageUrl(),
                    'path' => $results->path(),
                    'per_page' => $results->perPage(),
                    'prev_page_url' => $results->previousPageUrl(),
                    'to' => $results->lastItem(),
                    'total' => $results->total(),
                ],
                'search_params' => $inputGet,
                'sort_by' => $sortBy,
                'order' => $order,
            ], 200);
            
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch tiptaps',
                'error' => $e->getMessage()
            ], 500);
        }
    }

  public function statesList(Request $request)
{
    try {
        // Fetch all states from the database
        $states = State::all();
        
        // Check if states exist
        if ($states->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'No states found',
                'data' => []
            ], 404);
        }
        
        // Return successful response with states data
        return response()->json([
            'success' => true,
            'message' => 'States retrieved successfully',
            'data' => $states
        ], 200);
        
    } catch (\Exception $e) {
        // Handle any exceptions
        return response()->json([
            'success' => false,
            'message' => 'Failed to retrieve states',
            'error' => $e->getMessage()
        ], 500);
    }
}
   
    /**
     * Social Login (Facebook / Apple)
     * 
     * The mobile app handles the native Facebook/Apple login flow.
     * It sends us the social_id (provider user ID), email, name, and provider type.
     * We find or create the user and return a Passport access token.
     */
    public function socialLogin(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'social_id' => 'required|string',
                'provider'  => 'required|in:facebook,apple,google',
                'name'      => 'nullable|string',
                'email'     => 'nullable|email',
            ],
            [
                'social_id.required' => 'Social ID is required',
                'provider.required'  => 'Provider (facebook/apple/google) is required',
                'provider.in'        => 'Provider must be facebook, apple, or google',
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->messages(),
            ], 422);
        }

        try {
            $socialId = $request->input('social_id');
            $provider = $request->input('provider');
            $email    = $request->input('email');
            $name     = $request->input('name', '');

            // Step 1: Try to find user by social_id
            $user = User::where('social_id', $socialId)->first();

            // Step 2: If not found by social_id, try by email (if provided)
            if (!$user && $email) {
                $user = User::where('email', $email)->first();

                // Link the social_id to the existing email-based account
                if ($user) {
                    $user->social_id = $socialId;
                    $user->save();
                }
            }

            // Step 3: If still not found, create a new user
            if (!$user) {
                $user = new User();
                $user->name        = $name ?: $provider . '_user';
                $user->email       = $email ?: $socialId . '@' . $provider . '.social';
                $user->social_id   = $socialId;
                $user->is_verified = 1;
                $user->is_active   = 1;
                $user->country     = $request->input('country', '');
                $user->state       = $request->input('state', '');
                $user->language    = $request->input('language', '');
                $user->notify      = $request->input('notify', '');
                $user->phone_prefix       = $request->input('phone_prefix', '');
                $user->phone_country_code = $request->input('phone_country_code', '');
                $user->phone_number       = $request->input('phone_number', '');
                $user->save();
            }
     // Step 4: Check if user is active
            if ($user->is_active == 0 || $user->is_deleted == 1) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Your account has been deactivated. Please contact admin.',
                ], 403);
            }

            // Step 5: Register device token for push notifications
            if ($request->device_id) {
                // Remove old entries for this device
                UserDeviceToken::where('device_id', $request->device_id)->delete();

                UserDeviceToken::create([
                    'user_id'      => $user->id,
                    'device_type'  => $request->input('device_type', ''),
                    'device_id'    => $request->device_id,
                    'device_token' => $request->input('device_token', $request->device_id),
                ]);
            }

            // Step 6: Generate Passport access token
            $token = $user->createToken('API Token')->accessToken;

            // Step 7: Create notification settings if not exists
            NotificationSetting::firstOrCreate(
                ['user_id' => $user->id],
                ['festival_notification' => 1, 'push_notification' => json_encode(['festival_notification' => 1])]
            );

            return response()->json([
                'status'  => 'success',
                'message' => 'Social login successful',
                'token'   => $token,
                'user'    => $user,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'status'  => 'error',
                'message' => 'Social login failed',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Facebook Login
     *
     * The app performs native Facebook login via react-native-fbsdk-next
     * and sends us the raw Facebook access token.
     * We verify it with the Facebook Graph API to get the user's real ID + email,
     * then find or create the user and return a Passport access token.
     */
    public function facebookLogin(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'facebook_access_token' => 'required|string',
            ],
            [
                'facebook_access_token.required' => 'Facebook access token is required',
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->messages(),
            ], 422);
        }

        try {
            // Step 1: Verify the token with Facebook Graph API
            $fbToken  = $request->input('facebook_access_token');
            $graphUrl = 'https://graph.facebook.com/me?fields=id,name,email&access_token=' . urlencode($fbToken);

            $client       = new Client();
            $graphResponse = $client->get($graphUrl, ['http_errors' => false]);
            $fbData        = json_decode($graphResponse->getBody()->getContents(), true);

            // Check if Graph API returned an error
            if (isset($fbData['error']) || !isset($fbData['id'])) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Invalid Facebook access token. Please try again.',
                    'detail'  => $fbData['error']['message'] ?? 'Unknown error',
                ], 401);
            }

            $socialId = $fbData['id'];
            $name     = $fbData['name'] ?? '';
            $email    = $fbData['email'] ?? null;

            // Step 2: Find user by social_id
            $user = User::where('social_id', $socialId)->first();

            // Step 3: If not found by social_id, try by email
            if (!$user && $email) {
                $user = User::where('email', $email)->first();
                if ($user) {
                    $user->social_id = $socialId;
                    $user->save();
                }
            }

            // Step 4: If still not found, return redirect_signup so app collects profile info
            if (!$user) {
                return response()->json([
                    'status'   => 'success',
                    'redirect' => 'redirect_signup',
                    'message'  => 'Please complete your profile to continue.',
                    'user'     => [
                        'name'      => $name,
                        'email'     => $email,
                        'social_id' => $socialId,
                    ],
                ], 200);
            }

            // Step 5: Check if account is active
            if ($user->is_active == 0 || $user->is_deleted == 1) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Your account has been deactivated. Please contact admin.',
                ], 403);
            }

            // Step 6: Register device token for push notifications
            if ($request->device_id) {
                UserDeviceToken::where('device_id', $request->device_id)->delete();
                UserDeviceToken::create([
                    'user_id'     => $user->id,
                    'device_type' => $request->input('device_type', ''),
                    'device_id'   => $request->device_id,
                ]);
            }

            // Step 7: Generate Passport access token
            $token = $user->createToken('Facebook Token')->accessToken;

            // Step 8: Create notification settings if not exists
            NotificationSetting::firstOrCreate(
                ['user_id' => $user->id],
                ['festival_notification' => 1, 'push_notification' => json_encode(['festival_notification' => 1])]
            );

            return response()->json([
                'status'  => 'success',
                'message' => 'Facebook login successful',
                'token'   => $token,
                'user'    => $user,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'status'  => 'error',
                'message' => 'Facebook login failed',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

}
