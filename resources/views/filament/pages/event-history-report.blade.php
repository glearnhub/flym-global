<x-filament-panels::page>
    <x-filament::section>
        <table class="fi-ta-table w-full text-start">
            <thead>
                <tr class="border-b border-gray-200">
                    <th class="px-3 py-2 text-start text-sm font-semibold text-gray-950">Title</th>
                    <th class="px-3 py-2 text-start text-sm font-semibold text-gray-950">Venue</th>
                    <th class="px-3 py-2 text-start text-sm font-semibold text-gray-950">Date</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($events as $event)
                    <tr class="border-b border-gray-100">
                        <td class="px-3 py-2 text-sm text-gray-950">{{ $event->title }}</td>
                        <td class="px-3 py-2 text-sm text-gray-500">{{ $event->venue ?? '—' }}</td>
                        <td class="px-3 py-2 text-sm text-gray-950">{{ $event->event_date->format('F j, Y') }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3" class="px-3 py-6 text-center text-sm text-gray-500">No events yet.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </x-filament::section>
</x-filament-panels::page>
