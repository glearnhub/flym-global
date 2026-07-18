<?php

namespace App\Filament\Pages;

use App\Models\Department;
use Filament\Facades\Filament;
use Filament\Pages\Page;

class EventHistoryReport extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-clock';

    protected static ?string $navigationGroup = 'Reports';

    protected static ?string $navigationLabel = 'Event History';

    protected static ?string $title = 'Event History';

    protected static string $view = 'filament.pages.event-history-report';

    protected function getViewData(): array
    {
        /** @var Department $department */
        $department = Filament::getTenant();

        return [
            'events' => $department->events()->orderByDesc('event_date')->get(),
        ];
    }
}
