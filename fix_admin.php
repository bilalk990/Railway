<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$email = 'admin@admin.com';

try {
    $admin = DB::table('admins')->where('email', $email)->first();
    if ($admin) {
        DB::table('admins')->where('email', $email)->update([
            'password' => Hash::make('Admin@123'),
            'is_active' => 1,
            'is_deleted' => 0
        ]);
        echo "Password updated successfully for $email\n";
    } else {
        DB::table('admins')->insert([
            'name' => 'Admin Team',
            'email' => $email,
            'password' => Hash::make('Admin@123'),
            'user_role_id' => 1,
            'is_active' => 1,
            'is_deleted' => 0,
            'created_at' => now(),
            'updated_at' => now()
        ]);
        echo "Created new admin user: $email\n";
    }
} catch (\Exception $e) {
    echo "Could not update admin user (Database might be unavailable during build phase): " . $e->getMessage() . "\n";
}
