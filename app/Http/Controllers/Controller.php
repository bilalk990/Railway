<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\DB;
use App\Models\EmailLog;
use Config;
use Mail;
use Request;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	protected $user;
	
	public function __construct() {
		$url	=	Request::fullUrl();
	}// end function __construct()

	public function checkPermission($url){
		$segment1	=	Request()->segment(1);
		$segment2	=	Request()->segment(2);
		$segment3	=	Request()->segment(3);
		$actions_arr	=	[];
		
		$segment1_1 = explode(' ', $segment1);
		$segment1_1 = end($segment1_1);
		$segment2_2 = explode(' ', $segment2);
		$segment2_2 = end($segment2_2);
		$segment3_3 = explode(' ', $segment3);
		$segment3_3 = end($segment3_3);
		
		if (in_array($segment1_1,$actions_arr) || in_array($segment2_2,$actions_arr) || in_array($segment3_3,$actions_arr)){
			return 1;
		}
		
		$user_id				=	Auth::user()->id;
		$user_role_id			=	Auth::user()->user_role_id;
		$path					=	Request()->path();
		$action					=	Route::current()->getAction();
		
		$function_name	=	explode("\\",$action['controller']);
		$function_name	=	end($function_name);
		$permissionData			=	DB::table("user_permission_actions")
											->select("user_permission_actions.is_active")
											->leftJoin("acl_admin_actions","acl_admin_actions.id","=","user_permission_actions.admin_module_action_id")
											->where('user_permission_actions.user_id',$user_id)
											->where('user_permission_actions.is_active',1)
											->where('acl_admin_actions.function_name',$function_name)
											->first();
		
		$byDefaultPermissionData = DB::table("acl_admin_actions")
		->where('acl_admin_actions.is_show',0)
		->where('acl_admin_actions.function_name',$function_name)
		->first();
		if(!empty($permissionData) || !empty($byDefaultPermissionData)){
			return 1;
		}else{
			return 0;
		}
	}

    public function buildTree($parentId = 0){
		$user_id	    =	Auth::guard('admin')->user()->id;
		$user_role_id	=	Auth::guard('admin')->user()->user_role_id;
		$branch         =   array();
		$elements       =   array();
		$superadmin = Config('constants.ROLE_ID.SUPER_ADMIN_ROLE_ID');
        $language_id  = Session()->get('sel_lang');
		if($user_role_id == $superadmin){
			$elements = DB::table("acls")
                ->select("acls.*","acls.title as title")
                ->where("acls.parent_id",$parentId)
                ->where("acls.is_active",1)
                ->orderBy('acls.module_order','ASC')
                ->get();
		}else {
			if($parentId == 0){
				$elements = DB::table("acls")
                    ->select("acls.*","acls.title as title")
                    ->where("acls.parent_id",$parentId)
                    ->where("acls.is_active",1)
                    ->where("acls.id",DB::raw("(select admin_module_id from user_permissions where user_permissions.admin_module_id = acls.id AND is_active = 1 AND user_id = $user_id LIMIT 1)"))
                    ->orderBy('acls.module_order','ASC')
                    ->get();
			}else{ 
				$elements = 	DB::table("acls")
                    ->where("acls.parent_id",$parentId)
                    ->where("acls.is_active",1)
                    ->where("acls.id",DB::raw("(select admin_sub_module_id from user_permission_actions where user_permission_actions.admin_sub_module_id = acls.id AND is_active = 1 AND user_id = $user_id LIMIT 1)"))
                    ->orderBy('acls.module_order','ASC')
                    ->get();  
			}
		}
        
		foreach($elements as $element){
			if ($element->parent_id == $parentId){
				$children = $this->buildTree($element->id);
				if ($children){
					$element->children = $children;
				}
				$branch[] = $element;
			}
		}
		return $branch;
	}

	public function arrayStripTags($array)
    {
        $result = array();
        foreach ($array as $key => $value) {
            // Don't allow tags on key either, maybe useful for dynamic forms.
            $key = strip_tags($key, config('constants.ALLOWED_TAGS_XSS'));

            // If the value is an array, we will just recurse back into the
            // function to keep stripping the tags out of the array,
            // otherwise we will set the stripped value.
            if (is_array($value)) {
                $result[$key] = $this->arrayStripTags($value);
            } else {
                // I am using strip_tags(), you may use htmlentities(),
                // also I am doing trim() here, you may remove it, if you wish.
                $result[$key] = trim(strip_tags($value, config('constants.ALLOWED_TAGS_XSS')));
            }
        }

        return $result;

    }

	public function change_error_msg_layout($errors = array())
    {
        $response = array();
        $response["status"] = "error";
        if (!empty($errors)) {
            $error_msg = "";
            foreach ($errors as $errormsg) {
                $error_msg1 = (!empty($errormsg[0])) ? $errormsg[0] : "";
                $error_msg .= $error_msg1 . ", ";
            }
            $response["msg"] = trim($error_msg, ", ");
        } else {
            $response["msg"] = "";
        }
        $response["data"] = (object) array();
        $response["errors"] = $errors;
        return $response;
    }

    public function change_error_msg_layout_with_array($errors = array())
    {
        $response = array();
        $response["status"] = "error";
        if (!empty($errors)) {
            $error_msg = "";
            foreach ($errors as $errormsg) {
                $error_msg1 = (!empty($errormsg[0])) ? $errormsg[0] : "";
                $error_msg .= $error_msg1 . ", ";
            }
            $response["msg"] = trim($error_msg, ", ");
        } else {
            $response["msg"] = "";
        }
        $response["data"] = array();
        $response["errors"] = $errors;
        return $response;
    }

	public function getVerificationCode(){
		$code	=	rand(10000,99999);
	   
		return $code;
	}
	public function sendMail($to, $fullName, $subject, $messageBody, $from = '', $files = false, $path = '', $attachmentName = '')
    {
        $from = Config::get("Site.from_email");
        $data = array();
        $data['to'] = $to;
        $data['from'] = (!empty($from) ? $from : Config::get("Site.email"));
        $data['fullName'] = $fullName;
        $data['subject'] = $subject;
        $data['filepath'] = $path;
        $data['attachmentName'] = $attachmentName;
        if ($files === false) {
            Mail::send('emails.template', array('messageBody' => $messageBody), function ($message) use ($data) {
                $message->to($data['to'], $data['fullName'])->from($data['from'])->subject($data['subject']);
            });
        } else {
            if ($attachmentName != '') {
                Mail::send('emails.template', array('messageBody' => $messageBody), function ($message) use ($data) {
                    $message->to($data['to'], $data['fullName'])->from($data['from'])->subject($data['subject'])->attach($data['filepath'], array('as' => $data['attachmentName']));
                });
            } else {
                Mail::send('emails.template', array('messageBody' => $messageBody), function ($message) use ($data) {
                    $message->to($data['to'], $data['fullName'])->from($data['from'])->subject($data['subject'])->attach($data['filepath']);
                });
            }
        }
        $obj                  =  new EmailLog;
        $obj->email_to        =  $data['to'];
        $obj->email_from      =  $from;
        $obj->subject         =  $data['subject'];
        $obj->message         =  $messageBody;
        $obj->save();
    }

    public function current_language_id(){
		$language_code  = session()->get('admin_applocale');
        $session_key    = 'admin_lang_id_' . ($language_code ?: 'default');
        
        if (session()->has($session_key)) {
            return session()->get($session_key);
        }

        $language        = DB::table('languages')->where('lang_code',$language_code)->first();
        $language_id    = $language->id ?? 1;
		
        session()->put($session_key, $language_id);
		return $language_id;
	}
    
    public function saveCkeditorImages()
    {
        if (!empty($_GET['CKEditorFuncNum'])) {
            $image_url = "";
            $msg = "";
            // Will be returned empty if no problems
            $callback = ($_GET['CKEditorFuncNum']); // Tells CKeditor which function you are executing
            $image_details = getimagesize($_FILES['upload']["tmp_name"]);
            $image_mime_type = (isset($image_details["mime"]) && !empty($image_details["mime"])) ? $image_details["mime"] : "";
            if ($image_mime_type == 'image/jpeg' || $image_mime_type == 'image/jpg' || $image_mime_type == 'image/gif' || $image_mime_type == 'image/png') {
                $ext = $this->getExtension($_FILES['upload']['name']);
                $fileName = "ck_editor_" . time() . "." . $ext;
                $upload_path = config('constants.CK_EDITOR_ROOT_PATH');
                if (move_uploaded_file($_FILES['upload']['tmp_name'], $upload_path . $fileName)) {
                    $image_url = config('constants.CK_EDITOR_URL') . $fileName;
                }
            } else {
                $msg = 'error : Please select a valid image. valid extension are jpeg, jpg, gif, png';
            }
            $output = '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction(' . $callback . ', "' . $image_url . '","' . $msg . '");</script>';
            echo $output;
            exit;
        }
    }

    public function getExtension($str)
    {
        $i = strrpos($str, ".");
        if (!$i) {return "";}
        $l = strlen($str) - $i;
        $ext = substr($str, $i + 1, $l);
        $ext = strtolower($ext);
        return $ext;
    }

    function getFirebaseAccessToken(&$projectId = null) {
        $keyData = null;
        $source = "";

        // Choice 1: Use Environment Variable (Security Best Practice)
        $envCredentials = env('FIREBASE_CREDENTIALS');
        if (!empty($envCredentials)) {
            $keyData = json_decode($envCredentials, true);
            $source = "Environment Variable";
        }

        // Choice 2: Fallback to File (Local Development Only)
        if (!$keyData) {
            $keyFilePath = public_path('remyndnow-8ce2fb96e90f.json');
            $files = glob(public_path('*-firebase-adminsdk-*.json'));
            if (!empty($files)) {
                $keyFilePath = $files[0];
            } else {
                $files = glob(public_path('remyndnow-b55ae-*.json'));
                if (!empty($files)) {
                    $keyFilePath = $files[0];
                }
            }

            if (file_exists($keyFilePath)) {
                $jsonContent = file_get_contents($keyFilePath);
                $keyData = json_decode($jsonContent, true);
                $source = "File: " . basename($keyFilePath);
            }
        }

        if (!$keyData) {
            \Log::error('FCM Error: No Firebase credentials found in Environment or Files.');
            throw new \Exception('Firebase credentials not configured.');
        }

        try {
            if (!isset($keyData['private_key']) || !isset($keyData['project_id'])) {
                \Log::error("FCM Error: Missing required fields in $source");
                throw new \Exception("Invalid or corrupt service account key ($source): missing private_key or project_id");
            }

            $projectId = $keyData['project_id'];

            // Repairing private key formatting
            $keyData['private_key'] = $this->normalizePrivateKey($keyData['private_key']);

            \Log::info("FCM Info: Token fetch attempt for project: $projectId (Source: $source)");

            $credentials = new \Google\Auth\Credentials\ServiceAccountCredentials(
                'https://www.googleapis.com/auth/firebase.messaging',
                $keyData
            );
            
            $token = $credentials->fetchAuthToken();
            
            if (isset($token['access_token'])) {
                return $token['access_token'];
            } else {
                \Log::error('FCM Error: Token fetch failed', ['response' => $token, 'source' => $source]);
                throw new \Exception('Failed to fetch access token from Google: ' . json_encode($token));
            }
            
        } catch (\Exception $e) {
            \Log::error('FCM Exception: ' . $e->getMessage());
            throw $e;
        }
    }

    private function normalizePrivateKey($key) {
        // Ensure literal \n are replaced with real newlines
        $key = str_replace('\n', "\n", $key);
        
        // Remove whitespace and check headers
        $key = trim($key);
        if (strpos($key, '-----BEGIN PRIVATE KEY-----') === false) {
            $key = "-----BEGIN PRIVATE KEY-----\n" . $key;
        }
        if (strpos($key, '-----END PRIVATE KEY-----') === false) {
            $key = $key . "\n-----END PRIVATE KEY-----";
        }
        
        // Ensure correct PEM line formatting if mangled
        $inner = str_replace(["-----BEGIN PRIVATE KEY-----", "-----END PRIVATE KEY-----", "\n", "\r", " "], "", $key);
        $key = "-----BEGIN PRIVATE KEY-----\n" . chunk_split($inner, 64, "\n") . "-----END PRIVATE KEY-----";
        
        return $key;
    }

public function send_push_notification($deviceToken = "", $device_type = "", $message = "", $notification_title = "", $notification_type = "", $data = [])
{
    try {
        $notification = [
            "notification" => [
                "title" => $notification_title,
                "body" => $message,
            ],
            "token" => $deviceToken,
        ];

        if (!empty($data)) {
            $notification["data"] = array_map('strval', $data); 
            $notification["data"]["type"] = $notification_type; 
        }

        $body = json_encode(["message" => $notification]);

        \Log::info('FCM: Sending push notification', ['token' => $deviceToken, 'title' => $notification_title]);

        $projectId = null;
        $baerer_token = $this->getFirebaseAccessToken($projectId);
        
        if (!$projectId) {
            throw new \Exception("Could not determine Project ID from service account key.");
        }

        $headers = [
            'Authorization: Bearer ' . $baerer_token,
            'Content-Type: application/json',
            'Accept: application/json',
        ];

        $fcmUrl = "https://fcm.googleapis.com/v1/projects/{$projectId}/messages:send";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
        $result = curl_exec($ch);
        
        if (curl_errno($ch)) {
            \Log::error('FCM: Curl error', ['error' => curl_error($ch)]);
        }

        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        \Log::info('FCM: Send response', ['project' => $projectId, 'http_code' => $http_code, 'response' => $result]);

        $file = fopen(base_path("pushnotifications.txt"), "a+");
        fwrite($file, "\n\nTime: " . date('Y-m-d H:i:s') . "\nTarget Project: " . $projectId . "\nRequest:\n" . $body . "\n\nResponse:\n" . $result . "\n\n");
        fclose($file);

        return ["response" => $result, "request" => $body];
    } catch (\Exception $e) {
        \Log::error('FCM: Fatal error in send_push_notification: ' . $e->getMessage());
        return ["response" => json_encode(["error" => $e->getMessage()]), "request" => ""];
    }
}


}
