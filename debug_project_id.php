<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

$ctrl = new App\Http\Controllers\Controller();
$projectId = "N/A";

echo "Public Path: " . public_path() . "\n";

$f1 = glob(public_path('*-firebase-adminsdk-*.json'));
echo "Matches for *-firebase-adminsdk-*.json: " . count($f1) . "\n";
foreach($f1 as $f) echo " - " . basename($f) . "\n";

$f2 = glob(public_path('remyndnow-b55ae-*.json'));
echo "Matches for remyndnow-b55ae-*.json: " . count($f2) . "\n";
foreach($f2 as $f) echo " - " . basename($f) . "\n";

try {
    $token = $ctrl->getFirebaseAccessToken($projectId);
    echo "Current Effective Project ID: " . $projectId . "\n";
    // echo "Token: " . substr($token, 0, 10) . "...\n";
} catch (\Exception $e) {
    echo "Error calling getFirebaseAccessToken: " . $e->getMessage() . "\n";
}
