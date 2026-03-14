<?php

$json = file_get_contents('c:\Users\m\Desktop\application-&backend\remindnownew-firebase-adminsdk-fbsvc-67b34807d5.json');
$data = json_decode($json, true);
$key = $data['private_key'];

file_put_contents('c:\Users\m\Desktop\application-&backend\Remydn-now-backend-laravel\temp_key.pem', $key);
echo "Key extracted to temp_key.pem\n";
