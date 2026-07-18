<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Event;
use App\Models\GalleryPhoto;
use App\Models\Leader;
use App\Models\Position;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class LegacyFlymSeeder extends Seeder
{
    /**
     * Path to the legacy site's uploads folder, kept as the source of truth
     * for images referenced in the old flyjesus.sql dump.
     */
    protected string $legacyUploads = __DIR__.'/../../../flym_global/uploads';

    public function run(): void
    {
        $departments = $this->seedDepartments();
        $positions = $this->seedPositions($departments);
        $this->seedLeaders($departments, $positions);
        $this->seedEvents($departments);
        $this->seedGalleryPhotos($departments);
        $this->seedAdminUsers();
    }

    protected function seedDepartments(): array
    {
        // Only these 5 departments are publicly active, in this display order.
        // The rest are kept (not deleted, to preserve their leaders/events/etc.)
        // but deactivated so they don't show on the public site or nav.
        $rows = [
            ['code' => 'FLY_M1200', 'name' => 'Breach Repairers', 'founded_on' => '2005-01-01', 'description' => 'Ministry to university students.', 'is_active' => true, 'sort_order' => 1, 'theme_color' => '#4C9A2A', 'accent_color' => '#C1272D'],
            ['code' => 'FLY_M1100', 'name' => 'Junior Radicals', 'founded_on' => '2017-01-01', 'description' => 'Ministry to high schoolers and recent high-school graduates.', 'is_active' => true, 'sort_order' => 2, 'theme_color' => '#4A90D9', 'accent_color' => '#E8622C'],
            ['code' => 'FLY_M1000', 'name' => 'Lambs Ministry', 'founded_on' => '1987-01-02', 'description' => 'Ministry to children of primary-school age.', 'is_active' => true, 'sort_order' => 3, 'theme_color' => '#9C1F8C', 'accent_color' => '#F2A413'],
            ['code' => 'FLY_M1400', 'name' => 'Street for Christ', 'founded_on' => '2024-04-09', 'description' => 'Street evangelism outreach.', 'is_active' => true, 'sort_order' => 4, 'theme_color' => '#0504AA', 'accent_color' => '#EFBF04'],
            ['code' => 'FLY_M1300', 'name' => 'Alumni', 'founded_on' => '2015-01-31', 'description' => 'Fellowship for FLY-M alumni.', 'is_active' => true, 'sort_order' => 5, 'theme_color' => null, 'accent_color' => null],
            ['code' => 'FLY_M1500', 'name' => 'MTCs and TVETs', 'founded_on' => '2024-12-31', 'description' => 'Ministry to vocational and technical college students.', 'is_active' => false, 'sort_order' => 6, 'theme_color' => null, 'accent_color' => null],
            ['code' => 'FLY_M1600', 'name' => 'FLY-M General', 'founded_on' => '1987-01-31', 'description' => 'FLY-M Global overall leadership and executive committee.', 'is_active' => false, 'sort_order' => 7, 'theme_color' => null, 'accent_color' => null],
            ['code' => 'FLY_M1700', 'name' => 'FLY-M Media', 'founded_on' => '2024-01-01', 'description' => 'Media, communications, and content for FLY-M Global.', 'is_active' => false, 'sort_order' => 8, 'theme_color' => null, 'accent_color' => null],
        ];

        $departments = [];

        foreach ($rows as $row) {
            $departments[$row['name']] = Department::updateOrCreate(
                ['code' => $row['code']],
                [
                    'name' => $row['name'],
                    'slug' => Str::slug($row['name']),
                    'description' => $row['description'],
                    'founded_on' => $row['founded_on'],
                    'is_active' => $row['is_active'],
                    'sort_order' => $row['sort_order'],
                    'theme_color' => $row['theme_color'],
                    'accent_color' => $row['accent_color'],
                ]
            );
        }

        return $departments;
    }

    protected function seedPositions(array $departments): array
    {
        $names = [
            'Chairperson',
            'Treasurer',
            'Secretary',
            'Vice Chairperson',
            'Discipleship Leader',
            'Worship Leader',
            'Intercession Leader',
            'Welfare Leader',
        ];

        $positions = [];

        foreach ($names as $name) {
            $positions[$name] = Position::firstOrCreate([
                'department_id' => null,
                'name' => $name,
            ]);
        }

        return $positions;
    }

    protected function seedLeaders(array $departments, array $positions): void
    {
        // The legacy `leaders` table stored "Chairperson" as the position for
        // every row (a bug in the old admin form) while the real position was
        // often encoded in the department field instead. Leaders are remapped
        // here onto the correct department + position based on what the
        // original department string actually meant.
        $rows = [
            ['name' => 'Keziah Neema', 'phone' => '0702499324', 'department' => 'Lambs Ministry', 'position' => 'Chairperson'],
            ['name' => 'Gideon Kiplangat', 'phone' => '0702499324', 'department' => 'FLY-M Media', 'position' => 'Chairperson'],
            ['name' => 'Dcn. Daniel Kiteme', 'phone' => '0721233443', 'department' => 'Lambs Ministry', 'position' => 'Chairperson'],
            ['name' => 'Eldr. Cleophas Kosgei', 'phone' => '0729001702', 'department' => 'FLY-M General', 'position' => 'Chairperson'],
            ['name' => 'Dcn. Amugune Wilberforce', 'phone' => '0786789345', 'department' => 'FLY-M General', 'position' => 'Discipleship Leader'],
            ['name' => 'Dcns. Joy Amugune', 'phone' => '0716897456', 'department' => 'FLY-M General', 'position' => 'Worship Leader'],
        ];

        foreach ($rows as $index => $row) {
            Leader::firstOrCreate([
                'department_id' => $departments[$row['department']]->id,
                'full_name' => $row['name'],
            ], [
                'position_id' => $positions[$row['position']]->id,
                'phone_number' => $row['phone'],
                'sort_order' => $index,
            ]);
        }
    }

    protected function seedEvents(array $departments): void
    {
        $rows = [
            [
                'department' => 'Lambs Ministry',
                'title' => 'Crossover Radical Kesha',
                'description' => 'A crossover night of worship, prayer and the Word for the Lambs Ministry.',
                'venue' => 'KICC Amphitheatre Hall',
                'event_date' => '2025-01-24',
                'photo' => '6777b79e8a77f_Kesha_1.jpg',
            ],
            [
                'department' => 'Lambs Ministry',
                'title' => 'Restoration Radical Kesha - November Edition',
                'description' => 'A night of restoration, worship and prayer for the Lambs Ministry.',
                'venue' => 'CHRISCO CCC, Near Green Park',
                'event_date' => '2025-01-12',
                'photo' => '6779a262eba8d_founders_2.jpg',
            ],
        ];

        foreach ($rows as $row) {
            Event::firstOrCreate([
                'department_id' => $departments[$row['department']]->id,
                'title' => $row['title'],
            ], [
                'description' => $row['description'],
                'venue' => $row['venue'],
                'event_date' => $row['event_date'],
                'photo' => $this->copyLegacyImage($row['photo'], 'events'),
            ]);
        }
    }

    protected function seedGalleryPhotos(array $departments): void
    {
        $rows = [
            'Lambs Ministry' => ['Kesha_4.jpg', 'Kesha_2.jpg', 'Kesha_1.jpg', 'Kesha_3.jpg'],
            'Breach Repairers' => ['1736023543_about2.jpeg', '1736023543_about2.jpeg', '1736023543_founders_2.jpg', '1736023543_founders_1.jpeg'],
        ];

        foreach ($rows as $department => $photos) {
            foreach ($photos as $index => $photo) {
                $path = $this->copyLegacyImage($photo, 'gallery');

                GalleryPhoto::firstOrCreate([
                    'department_id' => $departments[$department]->id,
                    'photo_path' => $path,
                ], [
                    'sort_order' => $index,
                ]);
            }
        }
    }

    protected function seedAdminUsers(): void
    {
        // The legacy `users` table stored unsalted MD5 password hashes, which
        // cannot be converted to bcrypt. Migrated admins get a random temporary
        // password and must use the "forgot password" flow to set a new one.
        $rows = [
            ['name' => 'FLY-M Administrator', 'email' => 'ministryflym@gmail.com'],
            ['name' => 'Gideon Kiplangat', 'email' => 'gideonkiplangat4@gmail.com'],
        ];

        foreach ($rows as $row) {
            $tempPassword = Str::password(16);

            $user = User::firstOrCreate(
                ['email' => $row['email']],
                ['name' => $row['name'], 'password' => Hash::make($tempPassword)]
            );

            $user->assignRole('super_admin');

            $this->command?->warn("Seeded super admin {$row['email']} with temporary password: {$tempPassword}");
            $this->command?->warn('Use the password-reset flow to set a permanent password before sharing access.');
        }
    }

    protected function copyLegacyImage(string $filename, string $directory): ?string
    {
        $source = $this->legacyUploads.'/'.$filename;

        if (! is_file($source)) {
            return null;
        }

        $destination = "{$directory}/{$filename}";

        if (! Storage::disk('public')->exists($destination)) {
            Storage::disk('public')->put($destination, file_get_contents($source));
        }

        return $destination;
    }
}
