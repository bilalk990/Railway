<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Setting;
use View;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();

        // Force HTTPS in production (Railway uses HTTPS)
        // Check if NOT running in console to avoid breaking `php artisan` commands during deployment
        if (!$this->app->runningInConsole()) {
            if (config('app.env') === 'production' || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https')) {
                URL::forceScheme('https');
            }
        }

        try {
            $settings = \Illuminate\Support\Facades\Cache::remember('site_global_settings', 86400, function() {
                $settingKeys = [
                    'Social.youtube',
                    'Social.facebook',
                    'Social.twitter',
                    'Social.linkedin',
                    'Site.right'
                ];
                return Setting::whereIn('key', $settingKeys)->get()->keyBy('key');
            });
            
            View::share([
                'youtube'   => $settings->get('Social.youtube'),
                'facebook'  => $settings->get('Social.facebook'),
                'twitter'   => $settings->get('Social.twitter'),
                'linkedin'  => $settings->get('Social.linkedin'),
                'copyright' => $settings->get('Site.right'),
            ]);
        } catch (\Exception $e) {
            // Settings table may not exist yet
        }

    }
}
