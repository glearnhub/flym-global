<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class News extends Model
{
    use HasFactory;

    protected $fillable = [
        'department_id',
        'title',
        'body',
        'photo',
        'published_at',
    ];

    protected $casts = [
        'published_at' => 'datetime',
    ];

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }
}
