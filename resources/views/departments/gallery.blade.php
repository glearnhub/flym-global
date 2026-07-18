@extends('layouts.app')

@section('title', $department->name.' — Gallery')

@section('content')

    @include('partials.page-header', ['title' => $department->name])

    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5" style="max-width: 500px">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Gallery</div>
                <h1 class="display-6 mb-0">{{ $department->name }} Moments</h1>
            </div>

            <div class="row g-3">
                @forelse ($department->galleryPhotos as $photo)
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card">
                            <img src="{{ asset('storage/'.$photo->photo_path) }}" class="img-fluid" alt="{{ $photo->caption ?? $department->name }}">
                        </div>
                    </div>
                @empty
                    <p class="text-center">No photos yet — check back soon.</p>
                @endforelse
            </div>
        </div>
    </div>

@endsection
