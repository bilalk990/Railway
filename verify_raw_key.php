<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

$fAdmin = glob(public_path('remindnownew-firebase-adminsdk-*.json'));
if (empty($fAdmin)) {
    die("No matching JSON file found in public folder.\n");
}

$fAdmin = $fAdmin[0];
echo "Using file: " . basename($fAdmin) . "\n";

$json = file_get_contents($fAdmin);
$keyData = json_decode($json, true);

echo "Attempting auth with RAW json_decode data...\n";

try {
    $scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
    $creds = new \Google\Auth\Credentials\ServiceAccountCredentials($scopes, $keyData);
    $token = $creds->fetchAuthToken();
    if (isset($token['access_token'])) {
        echo "SUCCESS! Token generated.\n";
    } else {
        echo "FAILED: No access token in response.\n";
        print_r($token);
    }
} catch (\Exception $e) {
    echo "ERROR: " . $e->getMessage() . "\n";
}
