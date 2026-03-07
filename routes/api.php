<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware(['GuestApi'])->group(function () {
    Route::match(['get'], 'cms/{slug}', [App\Http\Controllers\api\UsersController::class, 'cms']);
    Route::match(['get'], 'faqs', [App\Http\Controllers\api\UsersController::class, 'faqs']);
    Route::match(['get'], 'state', [App\Http\Controllers\api\UsersController::class, 'statesList']);

    Route::match(['get','post'], 'signup', [App\Http\Controllers\api\UsersController::class, 'signup']);
    Route::match(['get','post'], 'check-verification-code/{validate_string}', [App\Http\Controllers\api\UsersController::class, 'check_verification_token']);
    Route::match(['get','post'], 'login', [App\Http\Controllers\api\UsersController::class, 'login']);
    Route::match(['get'], 'temples', [App\Http\Controllers\api\UsersController::class, 'temples']);

    
    Route::match(['get'], 'festival-detail/{id}', [App\Http\Controllers\api\UsersController::class, 'festivalDetail']);
    
    Route::match(['get'], 'tiptap-list', [App\Http\Controllers\api\UsersController::class, 'tiptapIndex']);

    Route::post('/panchang', [App\Http\Controllers\api\UsersController::class, 'getPanchang']);
    Route::match(['get','post'], 'social-login', [App\Http\Controllers\api\UsersController::class, 'socialLogin']);
    Route::post('auth/facebook', [App\Http\Controllers\api\UsersController::class, 'facebookLogin']);
    Route::get('test-passport', function() {
        try {
            $user = \App\Models\User::first();
            if (!$user) return response()->json(['error' => 'No user found'], 404);
            $token = $user->createToken('Test')->accessToken;
            return response()->json(['token' => $token]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    });
});


Route::middleware(['AuthApi'])->group(function () {
    Route::match(['get'], 'festivals', [App\Http\Controllers\api\UsersController::class, 'festivals']);
    Route::match(['get'], 'festivalstab', [App\Http\Controllers\api\UsersController::class, 'festivalstab']);
     Route::match(['post'], 'update-profile', [App\Http\Controllers\api\UsersController::class, 'updateProfile']);
     Route::match(['post'], 'delete-account', [App\Http\Controllers\api\UsersController::class, 'deleteAccount']);
     Route::match(['post'], 'create-reminders', [App\Http\Controllers\api\UsersController::class, 'createReminder']);  
     Route::match(['get'], 'get-reminders', [App\Http\Controllers\api\UsersController::class, 'getReminder']);  
     Route::match(['get'], 'delete-reminders/{id}', [App\Http\Controllers\api\UsersController::class, 'deleteReminder']);  
     
     Route::match(['get'], 'get-notifications', [App\Http\Controllers\api\UsersController::class, 'getManageNotification']);  
     Route::match(['post'], 'manage-notifications', [App\Http\Controllers\api\UsersController::class, 'updateManageNotification']);  
     Route::match(['get'], 'notification-list', [App\Http\Controllers\api\UsersController::class, 'notificationsList']);  

     
     
});
