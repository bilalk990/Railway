<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

// Test the project "remyndnow"
$fAdmin = public_path('remyndnow-8ce2fb96e90f.json');
if (!file_exists($fAdmin)) {
    die("File not found: $fAdmin\n");
}

echo "Testing file: " . basename($fAdmin) . "\n";

$json = file_get_contents($fAdmin);
$keyData = json_decode($json, true);

try {
    $scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
    $creds = new \Google\Auth\Credentials\ServiceAccountCredentials($scopes, $keyData);
    $token = $creds->fetchAuthToken();
    if (isset($token['access_token'])) {
        echo "SUCCESS! Token generated for Project: " . $keyData['project_id'] . "\n";
    } else {
        echo "FAILED: No access token.\n";
        print_r($token);
    }
} catch (\Exception $e) {
    echo "ERROR: " . $e->getMessage() . "\n";
}
