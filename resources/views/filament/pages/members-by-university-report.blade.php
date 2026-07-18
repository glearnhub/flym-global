<x-filament-panels::page>
    <x-filament::section>
        <table class="fi-ta-table w-full text-start">
            <thead>
                <tr class="border-b border-gray-200">
                    <th class="px-3 py-2 text-start text-sm font-semibold text-gray-950">University</th>
                    <th class="px-3 py-2 text-start text-sm font-semibold text-gray-950">Location</th>
                    <th class="px-3 py-2 text-start text-sm font-semibold text-gray-950">Members</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($universities as $university)
                    <tr class="border-b border-gray-100">
                        <td class="px-3 py-2 text-sm text-gray-950">{{ $university->name }}</td>
                        <td class="px-3 py-2 text-sm text-gray-500">{{ $university->location ?? '—' }}</td>
                        <td class="px-3 py-2 text-sm text-gray-950">{{ $university->members_count }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3" class="px-3 py-6 text-center text-sm text-gray-500">No universities yet.</td>
                    </tr>
                @endforelse
                @if ($unaffiliatedCount > 0)
                    <tr>
                        <td class="px-3 py-2 text-sm italic text-gray-500">Unaffiliated members</td>
                        <td class="px-3 py-2 text-sm text-gray-500">—</td>
                        <td class="px-3 py-2 text-sm text-gray-950">{{ $unaffiliatedCount }}</td>
                    </tr>
                @endif
            </tbody>
        </table>
    </x-filament::section>
</x-filament-panels::page>
