<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

try {
    $filePath = public_path('assets/media/svg/avatars/001-boy.svg');
    $file = new \Illuminate\Http\UploadedFile($filePath, 'test.svg', 'image/svg+xml', null, true);
    $result = cloudinary()->upload($file->getRealPath())->getSecurePath();
    echo "Success: " . $result . "\n";
} catch (\Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
