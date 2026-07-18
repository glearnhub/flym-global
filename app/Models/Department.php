<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Department extends Model
{
    use HasFactory;

    protected $fillable = [
        'code',
        'name',
        'slug',
        'description',
        'founded_on',
        'is_active',
        'sort_order',
        'theme_color',
        'accent_color',
    ];

    protected $casts = [
        'founded_on' => 'date',
        'is_active' => 'boolean',
    ];

    public function getRouteKeyName(): string
    {
        return 'slug';
    }

    public function positions(): HasMany
    {
        return $this->hasMany(Position::class);
    }

    public function leaders(): HasMany
    {
        return $this->hasMany(Leader::class);
    }

    public function members(): HasMany
    {
        return $this->hasMany(Member::class);
    }

    public function universities(): HasMany
    {
        return $this->hasMany(University::class);
    }

    public function isBreachRepairers(): bool
    {
        return $this->slug === 'breach-repairers';
    }

    /**
     * A lightened tint of theme_color, mixed toward white, for the glow
     * behind the logo in the navbar gradient. $amount 0 = no change, 1 = white.
     */
    public function lightThemeColor(float $amount = 0.65): ?string
    {
        if (! $this->theme_color) {
            return null;
        }

        return static::lightenColor($this->theme_color, $amount);
    }

    /**
     * Mix a #rrggbb hex color toward white by $amount (0 = no change, 1 = white).
     */
    public static function lightenColor(string $hex, float $amount = 0.65): string
    {
        [$r, $g, $b] = sscanf($hex, '#%02x%02x%02x');

        $r = (int) round($r + ($amount * (255 - $r)));
        $g = (int) round($g + ($amount * (255 - $g)));
        $b = (int) round($b + ($amount * (255 - $b)));

        return sprintf('#%02x%02x%02x', $r, $g, $b);
    }

    public function events(): HasMany
    {
        return $this->hasMany(Event::class);
    }

    public function galleryPhotos(): HasMany
    {
        return $this->hasMany(GalleryPhoto::class);
    }

    public function news(): HasMany
    {
        return $this->hasMany(News::class);
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }
}
