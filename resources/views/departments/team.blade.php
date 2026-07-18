@extends('layouts.app')

@section('title', $department->name.' — Be Part of the Team')

@section('content')

    @include('partials.page-header', ['title' => $department->name])

    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 mb-5">
                <div class="col-lg-8">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Join Us</div>
                    <h1 class="display-6 mb-4">Be Part of the {{ $department->name }} Team</h1>
                    <p class="mb-0">We'd love to have you join {{ $department->name }}. Reach out below and one of our leaders will get back to you.</p>
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
                </div>
            @endif

            <div class="row g-5">
                <div class="col-lg-8 wow fadeIn" data-wow-delay="0.1s">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Get In Touch</div>
                    <h3 class="display-6 mb-5">Tell Us You Want to Join</h3>

                    @if (session('status'))
                        <div class="alert alert-success">{{ session('status') }}</div>
                    @endif

                    <form method="POST" action="{{ route('contact.store') }}">
                        @csrf
                        <input type="hidden" name="department_id" value="{{ $department->id }}" />
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" id="name" name="name" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror" placeholder="Your Name" required />
                                    <label for="name">Your Name</label>
                                    @error('name')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="email" id="email" name="email" value="{{ old('email') }}" class="form-control @error('email') is-invalid @enderror" placeholder="Your Email" required />
                                    <label for="email">Your Email</label>
                                    @error('email')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="text" id="phone" name="phone" value="{{ old('phone') }}" class="form-control @error('phone') is-invalid @enderror" placeholder="Your Phone (optional)" />
                                    <label for="phone">Your Phone (optional)</label>
                                    @error('phone')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-floating">
                                    <textarea id="message" name="message" class="form-control @error('message') is-invalid @enderror" placeholder="Tell us why you'd like to join" required style="height: 100px">{{ old('message') }}</textarea>
                                    <label for="message">Message</label>
                                    @error('message')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="submit" class="btn btn-primary py-2 px-3 me-3">
                                    Send Message
                                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                                        <i class="fa fa-arrow-right"></i>
                                    </div>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
