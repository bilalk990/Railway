<?php

$json = file_get_contents('c:\Users\m\Desktop\application-&backend\Remydn-now-backend-laravel\public\remyndnow-8ce2fb96e90f.json');
$data = json_decode($json, true);
$key = $data['private_key'];

$res = openssl_pkey_get_private($key);
if ($res === false) {
    echo "ERROR: PHP OpenSSL failed to parse the private key.\n";
    while ($msg = openssl_error_string()) {
        echo "  - $msg\n";
    }
} else {
    echo "SUCCESS: PHP OpenSSL successfully parsed the private key.\n";
    $details = openssl_pkey_get_details($res);
    echo "Key Type: " . $details['type'] . "\n";
    echo "Key Bits: " . $details['bits'] . "\n";
}
