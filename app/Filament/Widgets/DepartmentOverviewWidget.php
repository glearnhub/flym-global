<?php

namespace App\Filament\Widgets;

use Filament\Facades\Filament;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class DepartmentOverviewWidget extends BaseWidget
{
    protected function getStats(): array
    {
        $department = Filament::getTenant();

        if (! $department) {
            return [];
        }

        return [
            Stat::make('Leaders', $department->leaders()->count())
                ->icon('heroicon-o-users'),
            Stat::make('Upcoming Events', $department->events()->where('event_date', '>=', now())->count())
                ->icon('heroicon-o-calendar-days'),
            Stat::make('Gallery Photos', $department->galleryPhotos()->count())
                ->icon('heroicon-o-photo'),
        ];
    }
}
