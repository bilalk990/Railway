<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class ProkeralaService
{
    protected $clientId;
    protected $clientSecret;
    protected $tokenUrl = 'https://api.prokerala.com/token';
    protected $apiUrl = 'https://api.prokerala.com/v2/astrology/panchang';

    public function __construct()
    {
        $this->clientId = config('services.prokerala.client_id');
        $this->clientSecret = config('services.prokerala.client_secret');
    }

    /**
     * Get OAuth2 Access Token
     */
    public function getAccessToken()
    {
        return Cache::remember('prokerala_access_token', 3500, function () {
            $response = Http::asForm()->post($this->tokenUrl, [
                'grant_type' => 'client_credentials',
                'client_id' => $this->clientId,
                'client_secret' => $this->clientSecret,
            ]);

            if ($response->failed()) {
                Log::error('Prokerala Auth Failed', [
                    'status' => $response->status(),
                    'body' => $response->body()
                ]);
                return null;
            }

            return $response->json('access_token');
        });
    }

    /**
     * Get Panchang Data
     * 
     * @param string $datetime ISO format
     * @param float $latitude
     * @param float $longitude
     */
    public function getPanchang($datetime, $latitude, $longitude)
    {
        $accessToken = $this->getAccessToken();

        if (!$accessToken) {
            return null;
        }

        $response = Http::withToken($accessToken)
            ->get($this->apiUrl, [
                'datetime' => $datetime,
                'location' => "$latitude,$longitude",
            ]);

        if ($response->failed()) {
            Log::error('Prokerala API Request Failed', [
                'status' => $response->status(),
                'body' => $response->body(),
                'datetime' => $datetime,
                'location' => "$latitude,$longitude",
            ]);
            return null;
        }

        return $response->json();
    }
}
