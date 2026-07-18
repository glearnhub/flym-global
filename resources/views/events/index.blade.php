@extends('layouts.app')

@section('title', 'Events')

@section('content')

    @include('partials.page-header', ['title' => 'Upcoming Events'])

    <div class="container mb-5">
        <div class="row g-4">
            @forelse ($events as $event)
                <div class="col-md-4">
                    <div class="card h-100">
                        @if ($event->photo)
                            <img src="{{ asset('storage/'.$event->photo) }}" class="card-img-top" alt="{{ $event->title }}">
                        @endif
                        <div class="card-body">
                            <p class="text-muted mb-1"><small>{{ $event->department->name }}</small></p>
                            <h5 class="card-title">{{ $event->title }}</h5>
                            @if ($event->venue)
                                <p class="card-text mb-1"><strong>Venue:</strong> {{ $event->venue }}</p>
                            @endif
                            <p class="card-text mb-1"><strong>Date:</strong> {{ $event->event_date->format('F j, Y') }}</p>
                            @if ($event->description)
                                <p class="card-text">{{ $event->description }}</p>
                            @endif
                        </div>
                    </div>
                </div>
            @empty
                <p class="text-center">Currently, we do not have any upcoming events.</p>
            @endforelse
        </div>
    </div>

@endsection
