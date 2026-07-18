<?php

namespace App\Filament\Pages;

use App\Models\Department;
use Filament\Facades\Filament;
use Filament\Pages\Page;

class OverviewReport extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-chart-bar';

    protected static ?string $navigationGroup = 'Reports';

    protected static ?string $navigationLabel = 'Overview';

    protected static ?string $title = 'Overview';

    protected static string $view = 'filament.pages.overview-report';

    protected function getViewData(): array
    {
        /** @var Department $department */
        $department = Filament::getTenant();

        return [
            'department' => $department,
            'leadersCount' => $department->leaders()->count(),
            'membersCount' => $department->members()->count(),
            'universitiesCount' => $department->isBreachRepairers() ? $department->universities()->count() : null,
            'upcomingEventsCount' => $department->events()->where('event_date', '>=', now()->toDateString())->count(),
            'galleryPhotosCount' => $department->galleryPhotos()->count(),
        ];
    }
}
