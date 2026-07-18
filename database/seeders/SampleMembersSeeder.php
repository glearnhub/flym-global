<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Member;
use App\Models\University;
use Illuminate\Database\Seeder;

class SampleMembersSeeder extends Seeder
{
    public function run(): void
    {
        $breachRepairers = Department::where('slug', 'breach-repairers')->first();
        $lambsMinistry = Department::where('slug', 'lambs-ministry')->first();

        if ($breachRepairers) {
            $universities = collect([
                ['name' => 'University of Nairobi', 'location' => 'Nairobi'],
                ['name' => 'Kabarak University', 'location' => 'Nakuru'],
                ['name' => 'Jomo Kenyatta University of Agriculture and Technology', 'location' => 'Kiambu'],
            ])->map(fn (array $row) => University::firstOrCreate([
                'department_id' => $breachRepairers->id,
                'name' => $row['name'],
            ], [
                'location' => $row['location'],
                'is_active' => true,
            ]));

            $members = [
                ['name' => 'Calvin Odhiambo', 'university' => 'Kabarak University', 'joined' => now()->subMonths(10)],
                ['name' => 'Ezinah Momanyi', 'university' => 'Kabarak University', 'joined' => now()->subMonths(8)],
                ['name' => 'Brian Otieno', 'university' => 'University of Nairobi', 'joined' => now()->subMonths(6)],
                ['name' => 'Faith Wanjiru', 'university' => 'University of Nairobi', 'joined' => now()->subMonths(4)],
                ['name' => 'Kevin Mutua', 'university' => 'Jomo Kenyatta University of Agriculture and Technology', 'joined' => now()->subMonths(3)],
                ['name' => 'Purity Chebet', 'university' => 'Jomo Kenyatta University of Agriculture and Technology', 'joined' => now()->subMonth()],
            ];

            foreach ($members as $index => $row) {
                $university = $universities->firstWhere('name', $row['university']);

                Member::firstOrCreate([
                    'department_id' => $breachRepairers->id,
                    'full_name' => $row['name'],
                ], [
                    'university_id' => $university?->id,
                    'joined_at' => $row['joined'],
                    'sort_order' => $index,
                ]);
            }
        }

        if ($lambsMinistry) {
            $members = ['Timothy Kariuki', 'Sarah Nyambura'];

            foreach ($members as $index => $name) {
                Member::firstOrCreate([
                    'department_id' => $lambsMinistry->id,
                    'full_name' => $name,
                ], [
                    'joined_at' => now()->subMonths($index + 1),
                    'sort_order' => $index,
                ]);
            }
        }
    }
}
