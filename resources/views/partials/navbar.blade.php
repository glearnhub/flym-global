@php
    $currentDepartment = request()->route('department');
@endphp

<div class="container-fluid fixed-top px-0 bg-dark" data-wow-delay="0.1s">
    <div class="top-bar text-white-50 row gx-0 align-items-center d-none d-lg-flex">
        <div class="col-lg-8 px-5 text-start">
            <small><i class="fa fa-map-marker-alt me-2"></i>Nairobi, KENYA &mdash; Global</small>
            <small class="ms-4 fs-6"><i class="fa fa-envelope me-2"></i>info@flym-global.org</small>
            <small class="ms-4 fs-6"><i class="fa fa-phone-alt me-2"></i>+254704900700</small>
        </div>
        <div class="col-lg-4 px-5 text-end">
            <small>Follow us:</small>
            <a class="text-white-50 ms-3" href="https://web.facebook.com/IAmInFlyM/" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a class="text-white-50 ms-3" href="https://x.com/FlyM2019" target="_blank"><i class="fab fa-twitter"></i></a>
            <a class="text-white-50 ms-3" href="https://www.youtube.com/@fly-mchannel1592" target="_blank"><i class="fab fa-youtube"></i></a>
            <a class="text-white-50 ms-3" href="https://www.instagram.com/ministryflym" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="{{ $currentDepartment ? route('department.home', $currentDepartment) : route('home') }}" class="navbar-brand ms-4 ms-lg-0 d-flex align-items-center">
            <img src="{{ asset('img/FLY-M.PNG') }}" alt="FLY-M Global" width="100">
            @if ($currentDepartment)
                <span class="ms-4 department-name text-white fw-bold fs-5">{{ $currentDepartment->name }}</span>
            @endif
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                @if ($currentDepartment)
                    <a href="{{ route('department.home', $currentDepartment) }}" class="nav-item nav-link {{ request()->routeIs('department.home') ? 'active' : '' }}">Home</a>
                    <a href="{{ route('department.events', $currentDepartment) }}" class="nav-item nav-link {{ request()->routeIs('department.events') ? 'active' : '' }}">Events</a>
                    <a href="{{ route('department.gallery', $currentDepartment) }}" class="nav-item nav-link {{ request()->routeIs('department.gallery') ? 'active' : '' }}">Gallery</a>
                    <a href="{{ route('department.team', $currentDepartment) }}" class="nav-item nav-link {{ request()->routeIs('department.team') ? 'active' : '' }}">Be Part of the Team</a>
                    <a href="{{ route('home') }}" class="nav-item nav-link"><i class="fa fa-arrow-left me-1"></i> Main Site</a>
                @else
                    <a href="{{ route('home') }}" class="nav-item nav-link {{ request()->routeIs('home') ? 'active' : '' }}">Home</a>
                    <a href="{{ route('about') }}" class="nav-item nav-link {{ request()->routeIs('about') ? 'active' : '' }}">About</a>

                    <div class="nav-item dropdown">
                        <a href="{{ route('departments.index') }}" class="nav-link dropdown-toggle {{ request()->routeIs('departments.*', 'department.*') ? 'active' : '' }}" data-bs-toggle="dropdown">Departments</a>
                        <div class="dropdown-menu m-0">
                            @foreach (\App\Models\Department::query()->where('is_active', true)->orderBy('sort_order')->get() as $navDepartment)
                                <a href="{{ route('department.home', $navDepartment) }}" class="dropdown-item">{{ $navDepartment->name }}</a>
                            @endforeach
                        </div>
                    </div>

                    <a href="{{ route('events.index') }}" class="nav-item nav-link {{ request()->routeIs('events.*') ? 'active' : '' }}">Events</a>
                    <a href="{{ route('news.index') }}" class="nav-item nav-link {{ request()->routeIs('news.*') ? 'active' : '' }}">News</a>
                    <a href="{{ route('gallery.index') }}" class="nav-item nav-link {{ request()->routeIs('gallery.*') ? 'active' : '' }}">Gallery</a>
                    <a href="{{ route('contact.show') }}" class="nav-item nav-link {{ request()->routeIs('contact.*') ? 'active' : '' }}">Contact Us</a>
                @endif
            </div>
            <div class="d-none d-lg-flex ms-2">
                <a class="btn btn-outline-primary py-2 px-3" href="{{ route('donate') }}">
                    Support
                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                        <i class="fa fa-arrow-right"></i>
                    </div>
                </a>
            </div>
        </div>
    </nav>
</div>
