<x-filament-panels::page>
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <x-filament::section>
            <div class="text-sm font-medium text-gray-500">Leaders</div>
            <div class="text-3xl font-bold text-gray-950">{{ $leadersCount }}</div>
        </x-filament::section>

        <x-filament::section>
            <div class="text-sm font-medium text-gray-500">Members</div>
            <div class="text-3xl font-bold text-gray-950">{{ $membersCount }}</div>
        </x-filament::section>

        @if (! is_null($universitiesCount))
            <x-filament::section>
                <div class="text-sm font-medium text-gray-500">Universities</div>
                <div class="text-3xl font-bold text-gray-950">{{ $universitiesCount }}</div>
            </x-filament::section>
        @endif

        <x-filament::section>
            <div class="text-sm font-medium text-gray-500">Upcoming Events</div>
            <div class="text-3xl font-bold text-gray-950">{{ $upcomingEventsCount }}</div>
        </x-filament::section>

        <x-filament::section>
            <div class="text-sm font-medium text-gray-500">Gallery Photos</div>
            <div class="text-3xl font-bold text-gray-950">{{ $galleryPhotosCount }}</div>
        </x-filament::section>
    </div>
</x-filament-panels::page>
