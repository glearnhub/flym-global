<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Leader extends Model
{
    use HasFactory;

    protected $fillable = [
        'department_id',
        'position_id',
        'full_name',
        'phone_number',
        'email',
        'photo',
        'sort_order',
    ];

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function position(): BelongsTo
    {
        return $this->belongsTo(Position::class);
    }
}
