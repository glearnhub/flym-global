@extends('layouts.app')

@section('title', 'Gallery')

@section('content')

    @include('partials.page-header', ['title' => 'Gallery'])

    <div class="container mb-5">
        <div class="row g-3">
            @forelse ($photos as $photo)
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="card">
                        <img src="{{ asset('storage/'.$photo->photo_path) }}" class="img-fluid" alt="{{ $photo->caption ?? $photo->department->name }}">
                        <div class="card-body py-2">
                            <small class="text-muted">{{ $photo->department->name }}</small>
                        </div>
                    </div>
                </div>
            @empty
                <p class="text-center">No photos yet &mdash; check back soon.</p>
            @endforelse
        </div>

        <div class="mt-4">
            {{ $photos->links() }}
        </div>
    </div>

@endsection
