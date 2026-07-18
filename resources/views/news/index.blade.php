@extends('layouts.app')

@section('title', 'News')

@section('content')

    @include('partials.page-header', ['title' => 'News'])

    <div class="container mb-5">
        <div class="row g-4">
            @forelse ($news as $item)
                <div class="col-md-4">
                    <div class="card h-100">
                        @if ($item->photo)
                            <img src="{{ asset('storage/'.$item->photo) }}" class="card-img-top" alt="{{ $item->title }}">
                        @endif
                        <div class="card-body">
                            <p class="text-muted mb-1"><small>{{ $item->department?->name ?? 'FLY-M Global' }} &middot; {{ $item->published_at?->format('F j, Y') }}</small></p>
                            <h5 class="card-title">{{ $item->title }}</h5>
                            <p class="card-text">{{ \Illuminate\Support\Str::limit($item->body, 160) }}</p>
                        </div>
                    </div>
                </div>
            @empty
                <p class="text-center">No news yet &mdash; check back soon.</p>
            @endforelse
        </div>

        <div class="mt-4">
            {{ $news->links() }}
        </div>
    </div>

@endsection
