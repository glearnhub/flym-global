<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Member extends Model
{
    use HasFactory;

    protected $fillable = [
        'department_id',
        'university_id',
        'full_name',
        'phone_number',
        'email',
        'photo',
        'joined_at',
        'sort_order',
    ];

    protected $casts = [
        'joined_at' => 'date',
    ];

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function university(): BelongsTo
    {
        return $this->belongsTo(University::class);
    }
}
