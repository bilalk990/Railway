<?php
// app/Console/Commands/SendDailyFestivalNotifications.php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Reminder;
use App\Models\Festival;
use App\Models\NotificationSetting;
use App\Models\User;
use App\Models\UserDeviceToken;
use App\Models\Notification;
use Carbon\Carbon;
use Log;
use App\Http\Controllers\Controller; // Import the base controller

class SendDailyFestivalNotifications extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notifications:daily-festival';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send daily festival notifications at 6 PM';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info('Starting daily festival notifications process...');
        
        try {
            // Get current date and time
            $today = Carbon::today();
            $now = Carbon::now();
            
            // Send festival notifications
            $this->sendFestivalNotifications($today);
            
            // Send reminder notifications
            $this->sendReminderNotifications($today);
            
            $this->info('Daily festival notifications process completed successfully.');
            Log::info('Daily festival notifications sent successfully at ' . $now->format('Y-m-d H:i:s'));
            
        } catch (\Exception $e) {
            $this->error('Error sending notifications: ' . $e->getMessage());
            Log::error('Error sending daily festival notifications: ' . $e->getMessage());
            
            return 0;
        }
        
        return 1;
    }
    
    /**
     * Send festival notifications for today's festivals
     */
    private function sendFestivalNotifications($today)
    {
        $this->info('Checking for festivals today...');
        
        // Format today's date in different formats for matching
        $todayDate = $today->format('Y-m-d');
        $todayDayMonth = $today->format('m-d');
        
        // Get festivals happening today (assuming festivals table has date column)
        $festivals = Festival::whereDate('date', $todayDate)
                            ->orWhereRaw("DATE_FORMAT(date, '%m-%d') = ?", [$todayDayMonth])
                            ->where('is_active', 1)
                            ->get();
        
        if ($festivals->isEmpty()) {
            $this->info('No festivals found for today.');
            return;
        }
        
        $this->info('Found ' . $festivals->count() . ' festivals for today.');
        
        // Get users who have festival notifications enabled
        $usersWithFestivalNotifications = NotificationSetting::where('festival_notification', 1)
                                                            ->whereHas('user', function($query) {
                                                                $query->where('is_active', 1)
                                                                      ->where('is_deleted', 0);
                                                            })
                                                            ->with('user')
                                                            ->get();
        
        $sentCount = 0;
        
        foreach ($usersWithFestivalNotifications as $notificationSetting) {
            $user = $notificationSetting->user;
            
            // Check if user has allowed push notifications
            if (!$this->hasPushNotificationsEnabled($notificationSetting)) {
                continue;
            }
            
            foreach ($festivals as $festival) {
                // Create notification message
                $message = $this->createFestivalMessage($festival, $user);
                
                // Get user's device tokens
                $deviceTokens = $this->getUserDeviceTokens($user->id);
                
                if ($deviceTokens->isEmpty()) {
                    continue;
                }
                
                // Store notification in database
                $this->storeNotification($user->id, $message['title'], $message['body']);
                
                // Send push notification using existing controller method
                foreach ($deviceTokens as $deviceToken) {
                    \Log::info('Festival notification: sending to token', ['token' => $deviceToken->device_id]);
                    // Use existing send_push_notification method from Controller
                    $controller = new Controller();
                    $controller->send_push_notification(
                        $deviceToken->device_id,
                        '', // device_type parameter
                        $message['body'],
                        $message['title'],
                        'festival',
                        [
                            'festival_id' => $festival->id,
                            'type' => 'festival',
                            'date' => $todayDate
                        ]
                    );
                }
                
                $sentCount++;
                Log::info('Festival notification sent to user: ' . $user->id . ' for festival: ' . $festival->id);
            }
        }
        
        $this->info('Sent ' . $sentCount . ' festival notifications.');
    }
    
    /**
     * Send reminder notifications
     */
    private function sendReminderNotifications($today)
    {
        $this->info('Checking for reminders...');
        
        $now = Carbon::now();

        // Get today's reminders that haven't been sent yet and whose time has come
        $reminders = Reminder::with(['user', 'festival'])
                            ->whereDate('date', $today->format('Y-m-d'))
                            ->whereTime('time', '<=', $now->format('H:i:s'))
                            ->where('sent', 0)
                            ->whereHas('user', function($query) {
                                $query->where('is_active', 1)
                                      ->where('is_deleted', 0);
                            })
                            ->whereHas('festival', function($query) {
                                $query->where('is_active', 1);
                            })
                            ->get();
        
        if ($reminders->isEmpty()) {
            $this->info('No reminders found for today.');
            return;
        }
        
        $this->info('Found ' . $reminders->count() . ' reminders for today.');
        
        $sentCount = 0;
        
        foreach ($reminders as $reminder) {
            $user = $reminder->user;
            $festival = $reminder->festival;
            
            // Check if user has festival notifications enabled
            $notificationSetting = NotificationSetting::where('user_id', $user->id)
                                                    ->where('festival_notification', 1)
                                                    ->first();
            
            if (!$notificationSetting || !$this->hasPushNotificationsEnabled($notificationSetting)) {
                continue;
            }
            
            // Create reminder message
            $message = $this->createReminderMessage($reminder, $festival, $user);
            
            // Get user's device tokens
            $deviceTokens = $this->getUserDeviceTokens($user->id);
            
            if ($deviceTokens->isEmpty()) {
                continue;
            }
            
            // Store notification in database
            $this->storeNotification($user->id, $message['title'], $message['body']);
            
            // Send push notification using existing controller method
            foreach ($deviceTokens as $deviceToken) {
                \Log::info('Reminder notification: sending to token', ['token' => $deviceToken->device_id]);
                // Use existing send_push_notification method from Controller
                $controller = new Controller();
                $controller->send_push_notification(
                    $deviceToken->device_id,
                    '', // device_type parameter
                    $message['body'],
                    $message['title'],
                    'reminder',
                    [
                        'festival_id' => $festival->id,
                        'reminder_id' => $reminder->id,
                        'type' => 'reminder',
                        'date' => $today->format('Y-m-d'),
                        'time' => $reminder->time
                    ]
                );
            }
            
            // Mark reminder as sent
            $reminder->sent = 1;
            $reminder->save();
            
            $sentCount++;
            Log::info('Reminder notification sent to user: ' . $user->id . ' for festival: ' . $festival->id);
        }
        
        $this->info('Sent ' . $sentCount . ' reminder notifications.');
    }
    
    /**
     * Create festival notification message
     */
    private function createFestivalMessage($festival, $user)
    {
        // You can customize messages based on user language preference
        $language = $user->language ?? 'en';
        
        // Default English messages
        $messages = [
            'en' => [
                'title' => '🎉 Festival Alert!',
                'body' => "Today is {$festival->name}. Wishing you a blessed celebration! 🙏"
            ],
            'hi' => [
                'title' => '🎉 त्योहार की सूचना!',
                'body' => "आज {$festival->name} है। आपको शुभकामनाएं! 🙏"
            ],
            // Add more languages as needed
        ];
        
        // Fallback to English if language not available
        $message = $messages[$language] ?? $messages['en'];
        
        // Add festival description if available
        if ($festival->festivalDesc) {
            $message['body'] .= ' ' . substr($festival->festivalDesc->description, 0, 100) . '...';
        }
        
        return $message;
    }
    
    /**
     * Create reminder notification message
     */
    private function createReminderMessage($reminder, $festival, $user)
    {
        $language = $user->language ?? 'en';
        
        $messages = [
            'en' => [
                'title' => '⏰ Reminder: Festival Today!',
                'body' => "Your reminder: {$festival->name} is today as scheduled."
            ],
            'hi' => [
                'title' => '⏰ अनुस्मारक: आज त्योहार है!',
                'body' => "आपका अनुस्मारक: {$festival->name} आज निर्धारित समय पर है।"
            ],
        ];
        
        $message = $messages[$language] ?? $messages['en'];
        
        // Add time if available
        if ($reminder->time) {
            $time = Carbon::parse($reminder->time)->format('h:i A');
            $message['body'] .= " Scheduled at {$time}.";
        }
        
        return $message;
    }
    
    /**
     * Check if user has push notifications enabled
     */
    private function hasPushNotificationsEnabled($notificationSetting)
    {
        // Check push_notification field
        $pushSettings = json_decode($notificationSetting->push_notification ?? '{}', true);
        
        // Default to enabled if field doesn't exist or is empty
        if (empty($pushSettings)) {
            return true;
        }
        
        // Check if festival notifications are enabled in push settings
        return isset($pushSettings['festival_notification']) && 
               $pushSettings['festival_notification'] == 1;
    }
    
    /**
     * Get user's device tokens
     */
    protected function getUserDeviceTokens($userId)
    {
        $tokens = UserDeviceToken::where('user_id', $userId)
                             ->whereNotNull('device_id')
                             ->where('device_id', '!=', '')
                             ->get();
        \Log::info('getUserDeviceTokens: found tokens', ['count' => $tokens->count(), 'user_id' => $userId]);
        return $tokens;
    }
    
    /**
     * Store notification in database
     */
    private function storeNotification($userId, $title, $description)
    {
        try {
            Notification::create([
                'user_id' => $userId,
                'title' => $title,
                'description' => $description,
                'is_read' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            
            Log::info('Notification stored in database for user: ' . $userId);
            
        } catch (\Exception $e) {
            Log::error('Error storing notification in database: ' . $e->getMessage());
        }
    }
}