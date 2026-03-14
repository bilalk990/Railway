<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\Reminder;
use App\Models\User;
use App\Models\UserDeviceToken;

echo "Public Path: " . public_path() . "\n";
$fAdmin = glob(public_path('*-firebase-adminsdk-*.json'));
echo "Glob *-firebase-adminsdk-*.json results: " . count($fAdmin) . "\n";
foreach ($fAdmin as $f) echo " - $f\n";

$reminderId = 93;
$reminder = Reminder::with(['user', 'festival'])->find($reminderId);

if (!$reminder) {
    echo "Reminder $reminderId not found.\n";
    exit;
}

echo "Reminder ID: " . $reminder->id . "\n";
echo "User ID: " . $reminder->user_id . "\n";
echo "User Name: " . ($reminder->user->name ?? 'N/A') . "\n";
echo "User Email: " . ($reminder->user->email ?? 'N/A') . "\n";
echo "Festival: " . ($reminder->festival->name ?? 'N/A') . "\n";
echo "Sent Status: " . $reminder->sent . "\n";
echo "Updated At: " . $reminder->updated_at . "\n";

echo "--- Last FCM Log ---\n";
$logPath = base_path('pushnotifications.txt');
if (file_exists($logPath)) {
    $content = file_get_contents($logPath);
    echo substr($content, -2000) . "\n";
} else {
    echo "Log file not found.\n";
}
