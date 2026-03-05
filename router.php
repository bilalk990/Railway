<?php
/**
 * Router for PHP built-in server (Railway deployment)
 * Serves static files (CSS, JS, images) directly from disk
 * Routes everything else through Laravel's index.php
 */

$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

$mimeTypes = [
    'css'  => 'text/css',
    'js'   => 'application/javascript',
    'json' => 'application/json',
    'png'  => 'image/png',
    'jpg'  => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'gif'  => 'image/gif',
    'svg'  => 'image/svg+xml',
    'ico'  => 'image/x-icon',
    'woff' => 'font/woff',
    'woff2'=> 'font/woff2',
    'ttf'  => 'font/ttf',
    'eot'  => 'application/vnd.ms-fontobject',
    'map'  => 'application/json',
    'webp' => 'image/webp',
];

// Helper to serve a file with correct Content-Type
function serveFile($filePath, $mimeTypes) {
    $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
    if (isset($mimeTypes[$ext])) {
        header('Content-Type: ' . $mimeTypes[$ext]);
    }
    readfile($filePath);
    return true;
}

if ($uri !== '/') {
    // 1) Try serving directly from project root (public/css, public/js, etc.)
    $filePath = __DIR__ . $uri;
    if (file_exists($filePath) && !is_dir($filePath)) {
        return serveFile($filePath, $mimeTypes);
    }

    // 2) Fallback: try public/ subdirectory
    //    This handles URLs like /public/uploads/Festival-image/... when the
    //    router is started from the project root (not from public/)
    $publicFilePath = __DIR__ . '/public' . $uri;
    if (file_exists($publicFilePath) && !is_dir($publicFilePath)) {
        return serveFile($publicFilePath, $mimeTypes);
    }
}

// Force HTTPS detection behind Railway's proxy
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
}

// Route everything else through Laravel
require __DIR__ . '/index.php';
