<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NotificationSetting extends Model
{
    protected $fillable = [
        'user_id',
        'daily_panchang',
        'festival_notification',
        'push_notification'
    ];

    protected $casts = [
        'daily_panchang' => 'boolean',
        'festival_notification' => 'boolean',
    ];

    // Relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
