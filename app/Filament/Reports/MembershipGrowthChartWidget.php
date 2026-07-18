<?php

namespace App\Filament\Reports;

use App\Models\Department;
use Filament\Facades\Filament;
use Filament\Widgets\ChartWidget;

class MembershipGrowthChartWidget extends ChartWidget
{
    protected static ?string $heading = 'Membership Growth (last 12 months)';

    protected function getData(): array
    {
        /** @var Department $department */
        $department = Filament::getTenant();

        $months = collect(range(0, 11))
            ->map(fn (int $i) => now()->subMonths(11 - $i)->startOfMonth());

        $counts = $months->map(function ($month) use ($department) {
            return $department->members()
                ->whereYear('joined_at', $month->year)
                ->whereMonth('joined_at', $month->month)
                ->count();
        });

        return [
            'datasets' => [
                [
                    'label' => 'New members',
                    'data' => $counts->all(),
                    'backgroundColor' => '#EFBF04',
                ],
            ],
            'labels' => $months->map(fn ($month) => $month->format('M Y'))->all(),
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}
