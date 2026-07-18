@extends('layouts.app')

@section('title', $department->name.' — Events')

@section('content')

    @include('partials.page-header', ['title' => $department->name])

    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5" style="max-width: 500px">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Events</div>
                <h1 class="display-6 mb-0">{{ $department->name }} Events</h1>
            </div>

            <div class="row g-4">
                @forelse ($department->events as $event)
                    <div class="col-lg-4 col-md-6">
                        <div class="card h-100">
                            @if ($event->photo)
                                <img src="{{ asset('storage/'.$event->photo) }}" class="card-img-top" alt="{{ $event->title }}">
                            @endif
                            <div class="card-body">
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
                    <p class="text-center">No events yet — check back soon.</p>
                @endforelse
            </div>
        </div>
    </div>

@endsection
