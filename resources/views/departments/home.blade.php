@extends('layouts.app')

@section('title', $department->name)

@section('content')

    @include('partials.page-header', ['title' => $department->name])

    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 mb-5">
                <div class="col-lg-8">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">About This Department</div>
                    <h1 class="display-6 mb-4">{{ $department->name }}</h1>
                    <p class="mb-3">{{ $department->description ?? 'More information about this department is coming soon.' }}</p>
                    @if ($department->founded_on)
                        <p class="text-muted">Founded {{ $department->founded_on->format('F Y') }}</p>
                    @endif
                </div>
            </div>

            @if ($department->leaders->isNotEmpty())
                <div class="mb-5">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Leadership</div>
                    <h2 class="display-6 mb-4">Meet the Team</h2>
                    <div class="row g-4">
                        @foreach ($department->leaders as $leader)
                            <div class="col-lg-3 col-md-6 wow fadeInUp">
                                <div class="service-item bg-white text-center h-100 p-4">
                                    @if ($leader->photo)
                                        <img src="{{ asset('storage/'.$leader->photo) }}" class="rounded-circle mb-3" width="100" height="100" style="object-fit: cover" alt="{{ $leader->full_name }}">
                                    @else
                                        <div class="rounded-circle bg-light mx-auto mb-3 d-flex align-items-center justify-content-center" style="width:100px;height:100px;">
                                            <i class="fa fa-user fa-2x text-primary"></i>
                                        </div>
                                    @endif
                                    <h5 class="mb-1 text-dark">{{ $leader->full_name }}</h5>
                                    @if ($leader->position)
                                        <span class="text-primary d-block mb-2">{{ $leader->position->name }}</span>
                                    @endif
                                    @if ($leader->phone_number)
                                        <small class="text-muted d-block"><i class="fa fa-phone-alt me-1"></i>{{ $leader->phone_number }}</small>
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <a href="{{ route('department.team', $department) }}" class="btn btn-primary py-2 px-3 mt-4">
                        Be Part of the Team
                        <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                            <i class="fa fa-arrow-right"></i>
                        </div>
                    </a>
                </div>
            @endif

            @if ($department->events->isNotEmpty())
                <div class="mb-5">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Events</div>
                    <h2 class="display-6 mb-4">Recent Events</h2>
                    <div class="row g-4">
                        @foreach ($department->events as $event)
                            <div class="col-lg-4 col-md-6 wow fadeInUp">
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
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <a href="{{ route('department.events', $department) }}" class="btn btn-outline-primary py-2 px-3 mt-4">View All Events</a>
                </div>
            @endif

            @if ($department->galleryPhotos->isNotEmpty())
                <div>
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Gallery</div>
                    <h2 class="display-6 mb-4">Moments</h2>
                    <div class="row g-3">
                        @foreach ($department->galleryPhotos as $photo)
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="card">
                                    <img src="{{ asset('storage/'.$photo->photo_path) }}" class="img-fluid" alt="{{ $photo->caption ?? $department->name }}">
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <a href="{{ route('department.gallery', $department) }}" class="btn btn-outline-primary py-2 px-3 mt-4">View Full Gallery</a>
                </div>
            @endif
        </div>
    </div>

@endsection
