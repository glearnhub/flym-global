<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class OfficialAdminUsersSeeder extends Seeder
{
    /**
     * Official login accounts: one org-wide Super Admin, plus one Department
     * Admin per department using an {abbreviation}@flymglobal.org / {Abbreviation}12345678!
     * pattern (matching the Breach Repairers example: br@flymglobal.org / Br12345678!).
     */
    public function run(): void
    {
        $superAdmin = User::updateOrCreate(
            ['email' => 'info@flym-global.org'],
            ['name' => 'FLY-M Global Super Admin', 'password' => Hash::make('Super12345678!')]
        );
        $superAdmin->syncRoles(['super_admin']);

        $departmentAbbreviations = [
            'lambs-ministry' => 'lm',
            'junior-radicals' => 'jr',
            'breach-repairers' => 'br',
            'alumni' => 'alumni',
            'street-for-christ' => 'sfc',
            'mtcs-and-tvets' => 'mtcs',
            'fly-m-general' => 'general',
            'fly-m-media' => 'media',
        ];

        foreach ($departmentAbbreviations as $slug => $abbreviation) {
            $department = Department::where('slug', $slug)->first();

            if (! $department) {
                continue;
            }

            $password = ucfirst($abbreviation).'12345678!';

            $user = User::updateOrCreate(
                ['email' => "{$abbreviation}@flymglobal.org"],
                ['name' => "{$department->name} Admin", 'password' => Hash::make($password)]
            );
            $user->syncRoles(['department_admin']);
            $user->departments()->sync([$department->id]);

            $this->command?->info("{$department->name}: {$abbreviation}@flymglobal.org / {$password}");
        }

        $this->command?->info("Super Admin: info@flym-global.org / Super12345678!");
    }
}
