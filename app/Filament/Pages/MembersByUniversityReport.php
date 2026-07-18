<?php

namespace App\Filament\Pages;

use App\Models\Department;
use Filament\Facades\Filament;
use Filament\Pages\Page;

class MembersByUniversityReport extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    protected static ?string $navigationGroup = 'Reports';

    protected static ?string $navigationLabel = 'Members by University';

    protected static ?string $title = 'Members by University';

    protected static string $view = 'filament.pages.members-by-university-report';

    /**
     * Universities are a Breach Repairers-only concept, so this report only
     * makes sense (and is only visible) for that department.
     */
    public static function shouldRegisterNavigation(): bool
    {
        return Filament::getTenant()?->isBreachRepairers() ?? false;
    }

    public static function canAccess(): bool
    {
        return Filament::getTenant()?->isBreachRepairers() ?? false;
    }

    protected function getViewData(): array
    {
        /** @var Department $department */
        $department = Filament::getTenant();

        return [
            'universities' => $department->universities()->withCount('members')->orderByDesc('members_count')->get(),
            'unaffiliatedCount' => $department->members()->whereNull('university_id')->count(),
        ];
    }
}
