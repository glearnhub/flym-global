@extends('layouts.app')

@section('title', 'Departments')

@section('content')

    @include('partials.page-header', ['title' => 'Our Departments'])

    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">FLY-M Global Departments</div>
                <h1 class="display-6 mb-3">Reaching Every Generation</h1>
                <p>From primary schools to universities and beyond, each department carries FLY-M's mission to a different generation.</p>
            </div>
            <div class="row g-4">
                @forelse ($departments as $department)
                    <div class="col-lg-4 col-md-6 wow fadeInUp">
                        <a href="{{ route('department.home', $department) }}" class="text-decoration-none">
                            <div class="service-item bg-white h-100 p-4 p-xl-5">
                                <h4 class="mb-3 text-dark">{{ $department->name }}</h4>
                                @if ($department->description)
                                    <p class="mb-3">{{ \Illuminate\Support\Str::limit($department->description, 140) }}</p>
                                @endif
                                @if ($department->founded_on)
                                    <p class="text-muted mb-3"><small>Since {{ $department->founded_on->format('Y') }}</small></p>
                                @endif
                                <span class="text-primary">Learn more <i class="fa fa-arrow-right ms-1"></i></span>
                            </div>
                        </a>
                    </div>
                @empty
                    <p class="text-center">Departments will appear here soon.</p>
                @endforelse
            </div>
        </div>
    </div>

@endsection
