<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Event extends Model
{
    use HasFactory;

    protected $fillable = [
        'department_id',
        'title',
        'description',
        'venue',
        'event_date',
        'photo',
    ];

    protected $casts = [
        'event_date' => 'date',
    ];

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }
}
