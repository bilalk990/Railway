#!/bin/bash
# Startup script to run the scheduler in the background and the web server in the foreground
# Generate passport keys and run migrations
php artisan passport:keys --force || true
php artisan migrate --force || true

# Start the Laravel schedule:run command in an infinite loop in the background
echo "Starting Laravel scheduler in the background..."
(
    while true; do
        php artisan schedule:run --verbose --no-interaction &
        sleep 60
    done
) &

# Start the PHP built-in web server in the foreground
echo "Starting PHP built-in server on port ${PORT:-8080}..."
php -S 0.0.0.0:${PORT:-8080} -t /var/www/html router.php
