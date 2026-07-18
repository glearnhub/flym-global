<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // 'super_admin' is the name Filament Shield's config bypasses all permission
        // checks for (config/filament-shield.php: super_admin.name) — no explicit
        // permissions need to be attached to it.
        Role::firstOrCreate(['name' => 'super_admin']);

        $departmentAdmin = Role::firstOrCreate(['name' => 'department_admin']);

        $departmentAdminPermissions = collect(['leader', 'event', 'gallery::photo', 'member', 'university'])
            ->flatMap(fn (string $subject) => [
                "view_{$subject}",
                "view_any_{$subject}",
                "create_{$subject}",
                "update_{$subject}",
                "delete_{$subject}",
                "reorder_{$subject}",
            ])
            ->all();

        $departmentAdmin->syncPermissions(
            Permission::whereIn('name', $departmentAdminPermissions)->get()
        );
    }
}
