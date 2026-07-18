<?php

namespace App\Filament\Pages;

use App\Filament\Reports\MembershipGrowthChartWidget;
use Filament\Pages\Page;

class MembershipGrowthReport extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-presentation-chart-line';

    protected static ?string $navigationGroup = 'Reports';

    protected static ?string $navigationLabel = 'Membership Growth';

    protected static ?string $title = 'Membership Growth';

    protected static string $view = 'filament.pages.membership-growth-report';

    protected function getHeaderWidgets(): array
    {
        return [
            MembershipGrowthChartWidget::class,
        ];
    }
}
