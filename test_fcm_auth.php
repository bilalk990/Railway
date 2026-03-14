<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

$keyFilePath = public_path('remindnownew-firebase-adminsdk-fbsvc-67b34807d5.json');

if (!file_exists($keyFilePath)) {
    die("Key file not found.\n");
}

$jsonContent = file_get_contents($keyFilePath);
$keyData = json_decode($jsonContent, true);

echo "Attempt 1: Raw Key directly from json_decode\n";
try {
    $creds = new \Google\Auth\Credentials\ServiceAccountCredentials(
        'https://www.googleapis.com/auth/firebase.messaging',
        $keyData
    );
    $token = $creds->fetchAuthToken();
    echo "Success! Token: " . substr($token['access_token'], 0, 15) . "...\n";
} catch (\Exception $e) {
    echo "Failed: " . $e->getMessage() . "\n";
}

echo "\nAttempt 2: With current normalization\n";
$keyDataCurrent = $keyData;
$key = $keyDataCurrent['private_key'];
$key = str_replace('\n', "\n", $key);
$key = trim($key);
if (strpos($key, '-----BEGIN PRIVATE KEY-----') === false) { $key = "-----BEGIN PRIVATE KEY-----\n" . $key; }
if (strpos($key, '-----END PRIVATE KEY-----') === false) { $key = $key . "\n-----END PRIVATE KEY-----"; }
$inner = str_replace(["-----BEGIN PRIVATE KEY-----", "-----END PRIVATE KEY-----", "\n", "\r", " "], "", $key);
$keyDataCurrent['private_key'] = "-----BEGIN PRIVATE KEY-----\n" . chunk_split($inner, 64, "\n") . "-----END PRIVATE KEY-----";

try {
    $creds = new \Google\Auth\Credentials\ServiceAccountCredentials(
        'https://www.googleapis.com/auth/firebase.messaging',
        $keyDataCurrent
    );
    $token = $creds->fetchAuthToken();
    echo "Success! Token: " . substr($token['access_token'], 0, 15) . "...\n";
} catch (\Exception $e) {
    echo "Failed: " . $e->getMessage() . "\n";
}
