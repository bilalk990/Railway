#!/bin/bash
# Startup script to run the scheduler in the background and the web server in the foreground
# Generate passport keys if they don't exist
if [ ! -f storage/oauth-private.key ]; then
    php artisan passport:keys --force || true
fi
# Ensure storage directories exist
mkdir -p storage/framework/sessions
mkdir -p storage/framework/views
mkdir -p storage/framework/cache
chmod -R 777 storage bootstrap/cache

php artisan migrate --force || true
php artisan config:clear
php artisan view:clear

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
