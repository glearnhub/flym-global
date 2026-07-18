@extends('layouts.app')

@section('title', 'About Us')

@section('content')

    @include('partials.page-header', ['title' => 'About Us'])

    <div class="container-xxl py-5" id="who_are_we">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="position-relative overflow-hidden h-100" style="min-height: 400px">
                        <img class="position-absolute w-100 h-100 pt-5 pe-5" src="{{ asset('img/about.jpg') }}" alt="" style="object-fit: cover" />
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="h-100">
                        <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Who Are We?</div>
                        <h1 class="display-6 mb-5">
                            We are a Christ-centered, interdenominational fellowship that empowers young people to navigate spiritual, professional, and social challenges through Biblical principles &mdash; from Kenya to the world.
                        </h1>
                        <div class="bg-light border-bottom border-5 border-primary rounded p-4 mb-4">
                            <p class="text-dark mb-2">
                                Empowering the next generation to walk in faith, guided by His Word, and equipped for life's journey with wisdom and purpose.
                            </p>
                            <span class="text-primary">Kato C. Lafont, Founder</span>
                        </div>
                        <p class="mb-5">
                            Feed My Lambs Youth Ministry Global (FLY-M Global) is an interdenominational
                            fellowship dedicated to guiding young people in their spiritual,
                            professional, and social journeys. Rooted in Biblical
                            principles, FLY-M Global aims to help youth build a personal
                            relationship with Jesus while empowering them to navigate life&rsquo;s
                            challenges in faith, integrity, and responsibility. Founded on
                            the Five-Fold Ministry &mdash; Apostles, Prophets, Evangelists, Pastors,
                            and Teachers &mdash; FLY-M Global seeks to equip young people to handle life
                            issues with wisdom and purpose.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('partials.services')

    <div class="container-xxl py-5" id="founders">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="h-100">
                        <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Founders</div>
                        <h1 class="display-6 mb-5">Guiding a Generation with Purpose</h1>
                        <div class="bg-light border-bottom border-5 border-primary rounded p-4 mb-4">
                            <p class="text-dark mb-2">
                                At Feed My Lambs Youth Ministry (FLY-M), our heart beats for a
                                generation of young people equipped to walk uprightly in their
                                spiritual, professional, and social lives. Through our outreach
                                programs across universities, high schools, and primary schools &mdash;
                                and now across the globe &mdash; we bring a holistic approach to
                                spiritual growth and social impact.
                            </p>
                            <br>
                            <p class="text-dark mb-2">Blessings</p>
                            <span class="text-primary">Presbyter Kato C. Lafont &amp; Pastor Joan I. Lafont <br> Founders, Feed My Lambs Youth Ministry</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="position-relative overflow-hidden h-100" style="min-height: 400px">
                        <img class="position-absolute w-100 h-100 pt-5 pe-5" src="{{ asset('img/founders_2.jpg') }}" alt="" style="object-fit: cover" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="main" id="our_history">
        <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Our History</div>
        <br>
        <div class="box m-5">
            <ul>
                <li>
                    <h3 class="heading">FLY-M Founded</h3>
                    <p>FLY-M was founded in 1987 by Presbyter Kato, who initially received invitations to conduct pastoral programs in primary schools, starting with Moi Avenue Primary School in Nairobi.</p>
                    <span class="date">January 1987</span>
                    <span class="circle"></span>
                </li>
                <li>
                    <h3 class="heading">FLY-M Breach Repairers</h3>
                    <p>Breach Repairers (BR) was founded in 2005 with the vision of promoting balanced living and addressing the challenges faced by students transitioning from high school to higher institutions of learning.</p>
                    <span class="date">February 2005</span>
                    <span class="circle"></span>
                </li>
                <li>
                    <h3 class="heading">FLY-M Junior Radicals</h3>
                    <p>FLY-M Junior Radicals (JR) was created in June 2017 to keep students engaged during school holidays, and became especially important during the Covid-19 lockdown.</p>
                    <span class="date">March 2017</span>
                    <span class="circle"></span>
                </li>
                <li>
                    <h3 class="heading">FLY-M Alumni</h3>
                    <p>Alumni was founded to provide essential support after campus by fostering networking opportunities, career guidance, and mentorship for graduates.</p>
                    <span class="date">April 2018</span>
                    <span class="circle"></span>
                </li>
                <li>
                    <h3 class="heading">FLY-M Global</h3>
                    <p>FLY-M expands beyond Kenya, becoming FLY-M Global &mdash; carrying the same mission to young people across the world.</p>
                    <span class="date">2026</span>
                    <span class="circle"></span>
                </li>
            </ul>
        </div>
    </div>

@endsection
