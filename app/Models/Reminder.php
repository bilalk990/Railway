<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reminder extends Model
{
    use HasFactory;
    protected $table = 'reminders';
    
    protected $fillable = [
        'user_id',
        'festival_id',
        'date',
        'time',
        'is_recurring',
        'sent',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function festival()
    {
        return $this->belongsTo(Festival::class, 'festival_id');
    }
    
}
