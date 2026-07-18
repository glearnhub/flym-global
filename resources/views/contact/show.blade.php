@extends('layouts.app')

@section('title', 'Contact Us')

@section('content')

    @include('partials.page-header', ['title' => 'Contact Us'])

    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Contact Us</div>
                    <h3 class="display-6 mb-5">If You Have Any Query, Please Contact Us</h3>

                    @if (session('status'))
                        <div class="alert alert-success">{{ session('status') }}</div>
                    @endif

                    <form method="POST" action="{{ route('contact.store') }}">
                        @csrf
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
                                    <textarea id="message" name="message" class="form-control @error('message') is-invalid @enderror" placeholder="Leave a message here" required style="height: 100px">{{ old('message') }}</textarea>
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
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s" style="min-height: 450px">
                    <div class="position-relative rounded overflow-hidden h-100">
                        <iframe
                            class="position-relative w-100 h-100"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8034729386954!2d36.8184897732075!3d-1.2923217356290553!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f10d5dfa419c9%3A0x2231b24ba92f77a4!2sCommerce%20house!5e0!3m2!1sen!2ske!4v1735057952241!5m2!1sen!2ske"
                            style="min-height: 450px; border: 0"
                            allowfullscreen
                            loading="lazy"
                        ></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
