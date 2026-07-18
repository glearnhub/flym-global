@extends('layouts.app')

@section('title', 'Home')

@section('content')

    <div class="container-fluid p-0 mb-5">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="{{ asset('img/home-bg.gif') }}" alt="FLY-M Global" />
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7 pt-5">
                                    <h1 class="display-4 text-white mb-3 animated slideInDown">Our Vision Statement</h1>
                                    <p class="fs-5 text-white-50 mb-5 animated slideInDown">
                                        A generation of young people who are upright professionally, socially and spiritually through Biblical principles &mdash; across the globe.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="{{ asset('img/home-bg.gif') }}" alt="FLY-M Global" />
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7 pt-5">
                                    <h1 class="display-4 text-white mb-3 animated slideInDown">Our Mission Statement</h1>
                                    <p class="fs-5 text-white-50 mb-5 animated slideInDown">
                                        To reach out to young people and help them find direction in life spiritually, professionally and have a balanced walk in their faith towards God from within the learning institution.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="position-relative overflow-hidden h-100" style="min-height: 400px">
                        <img class="position-absolute w-100 h-100 pt-5 pe-5" src="{{ asset('img/about.jpg') }}" alt="" style="object-fit: cover" />
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="h-100">
                        <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">About Us</div>
                        <h1 class="display-6 mb-5">Who Are We?</h1>
                        <p class="mb-5">
                            Feed My Lambs Youth Ministry Global (FLY-M Global) is an interdenominational fellowship dedicated to guiding young people in their spiritual, professional, and social journeys. Rooted in Biblical principles, FLY-M Global aims to help youth build a personal relationship with Jesus while empowering them to navigate life&rsquo;s challenges in faith, integrity, and responsibility &mdash; now reaching beyond Kenya to the world.
                        </p>
                        <a class="btn btn-primary py-2 px-3 me-3" href="{{ route('about') }}">
                            Learn More
                            <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                                <i class="fa fa-arrow-right"></i>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-xxl py-5 bg-light">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Our Departments</div>
                <h1 class="display-6 mb-5">Reaching Every Generation</h1>
            </div>
            <div class="row g-4">
                @foreach ($departments as $department)
                    <div class="col-lg-3 col-md-6 wow fadeInUp">
                        <a href="{{ route('department.home', $department) }}" class="text-decoration-none">
                            <div class="service-item bg-white text-center h-100 p-4">
                                <h5 class="mb-2 text-dark">{{ $department->name }}</h5>
                                <span class="text-primary">Learn more <i class="fa fa-arrow-right ms-1"></i></span>
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    @include('partials.services')

    <div class="container my-5">
        <div class="row text-center">
            <div class="col-md-3 col-6 mb-4">
                <div class="countdown-item">
                    <h2 class="display-4 fw-bold">25+</h2>
                    <p class="text-muted">Universities</p>
                </div>
            </div>
            <div class="col-md-3 col-6 mb-4">
                <div class="countdown-item">
                    <h2 class="display-4 fw-bold">50+</h2>
                    <p class="text-muted">High Schools</p>
                </div>
            </div>
            <div class="col-md-3 col-6 mb-4">
                <div class="countdown-item">
                    <h2 class="display-4 fw-bold">20+</h2>
                    <p class="text-muted">Primary Schools</p>
                </div>
            </div>
            <div class="col-md-3 col-6 mb-4">
                <div class="countdown-item">
                    <h2 class="display-4 fw-bold">10+</h2>
                    <p class="text-muted">TVETs &amp; MTCs</p>
                </div>
            </div>
        </div>
    </div>

    @include('partials.donate-section')

    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Testimonial</div>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="testimonial-item text-center">
                    <img class="img-fluid bg-light rounded-circle p-2 mx-auto mb-4" src="{{ asset('img/calvin_br.jpg') }}" style="width: 100px; height: 100px" />
                    <div class="testimonial-text rounded text-center p-4">
                        <p>"To the glory of God through Kabarak BR I was able to be filled with the Holy Spirit, connected to a family of believers, and discovered my identity in Christ. My sincere gratitude to Fly-M leadership, BR family."</p>
                        <h5 class="mb-1">Calvin Odhiambo</h5>
                        <span class="fst-italic">Breach Repairers</span>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="img-fluid bg-light rounded-circle p-2 mx-auto mb-4" src="{{ asset('img/ezina_br.jpg') }}" style="width: 100px; height: 100px" />
                    <div class="testimonial-text rounded text-center p-4">
                        <p>"Breach Repairers was the turning point in my spiritual and personal journey, transforming me from a lost and unsure believer into a confident leader grounded in faith."</p>
                        <h5 class="mb-1">Ezinah Momanyi</h5>
                        <span class="fst-italic">Breach Repairers</span>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="img-fluid bg-light rounded-circle p-2 mx-auto mb-4" src="{{ asset('img/FLY-M.PNG') }}" style="width: 100px; height: 100px" />
                    <div class="testimonial-text rounded text-center p-4">
                        <p>"FLY-M's Alumni Association has been an incredible support system as I transitioned from student life into the professional world, helping me integrate faith into my career."</p>
                        <h5 class="mb-1">Gideon Kiplangat</h5>
                        <span class="fst-italic">FLY-M Alumni</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
