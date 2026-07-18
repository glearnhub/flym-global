<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>@yield('title', 'FLY-M Global') &mdash; Feed My Lambs Youth Ministry</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="keywords" content="FLY-M, FLY-M Global, Breach Repairers, Junior Radicals, Lambs Ministry" />
    <meta name="description" content="Feed My Lambs Youth Ministry Global (FLY-M Global) is an interdenominational fellowship dedicated to guiding young people in their spiritual, professional, and social journeys, reaching different age groups across the world." />

    <link href="{{ asset('img/FLY-M.PNG') }}" rel="icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="{{ asset('lib/animate/animate.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('lib/owlcarousel/assets/owl.carousel.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('theme-css/bootstrap.min.css') }}" rel="stylesheet" />
    <link rel="icon" href="{{ asset('img/FLY-M.PNG') }}" type="image/x-icon" />
    <link href="{{ asset('theme-css/style.css') }}" rel="stylesheet" />

    @php
        $currentDepartment = request()->route('department');
        // The header/footer background for this page: the department's brand
        // color if it has one, otherwise the site's own default navy.
        $headerBaseColor = $currentDepartment?->theme_color ?? '#001D23';
    @endphp

    <style>
        /* Footer always matches the header background color for this page. */
        .footer.bg-dark { background-color: {{ $headerBaseColor }} !important; }

        /* The newsletter "SignUp" button and "back to top" arrow sit on that
           background, so force them to a white pill instead of inheriting
           btn-primary (which would otherwise match the background and vanish). */
        .footer .btn-primary,
        .back-to-top.btn-primary {
            background-color: #FFFFFF !important;
            border-color: #FFFFFF !important;
            color: {{ $headerBaseColor }} !important;
        }
    </style>

    @if (! $currentDepartment)
        {{-- Main site only: light glow behind the logo fading into the site's navy. --}}
        <style>
            .fixed-top.bg-dark {
                background: linear-gradient(
                    to right,
                    {{ \App\Models\Department::lightenColor($headerBaseColor, 0.45) }} 0%,
                    {{ $headerBaseColor }} 40%,
                    {{ $headerBaseColor }} 100%
                ) !important;
            }
            .fixed-top .top-bar { background-color: rgba(0, 0, 0, .18); }
        </style>
    @endif

    @if ($currentDepartment?->theme_color)
        @php
            $menuHighlightColor = $currentDepartment->accent_color ?? '#FFFFFF';
        @endphp
        <style>
            :root { --primary: {{ $currentDepartment->theme_color }}; }

            /* Department buttons/pills/links on white content backgrounds */
            .text-primary { color: {{ $currentDepartment->theme_color }} !important; }
            .bg-primary { background-color: {{ $currentDepartment->theme_color }} !important; }
            .border-primary { border-color: {{ $currentDepartment->theme_color }} !important; }
            .btn-primary { background-color: {{ $currentDepartment->theme_color }} !important; border-color: {{ $currentDepartment->theme_color }} !important; color: #fff !important; }
            .btn-outline-primary { color: {{ $currentDepartment->theme_color }} !important; border-color: {{ $currentDepartment->theme_color }} !important; }
            .btn-outline-primary:hover { background-color: {{ $currentDepartment->theme_color }} !important; color: #fff !important; }

            /* The department's own navigation bar, recolored to its brand (solid). */
            .fixed-top.bg-dark { background-color: {{ $currentDepartment->theme_color }} !important; }
            .fixed-top .top-bar { background-color: rgba(0, 0, 0, .18); }

            /* Nav links stay white; active/hover changes only the text color
               (no background pill) to a highlight color drawn from the
               department's own logo, so it stays legible without boxing it in. */
            .navbar .navbar-nav .nav-link:hover,
            .navbar .navbar-nav .nav-link.active {
                color: {{ $menuHighlightColor }} !important;
                background-color: transparent !important;
            }

            /* The footer copyright link hovers the same way the nav menu does,
               instead of var(--primary) which would now match the footer's
               own background and disappear. */
            .footer .copyright a:hover {
                color: {{ $menuHighlightColor }} !important;
            }

            /* The "Support" button and department-name badge live on the
               colored navbar itself, so they need to stay white rather than
               inherit the (now same-color) primary override above. */
            .fixed-top .btn-outline-primary {
                color: #FFFFFF !important;
                border-color: #FFFFFF !important;
            }
            .fixed-top .btn-outline-primary:hover {
                background-color: #FFFFFF !important;
                color: {{ $currentDepartment->theme_color }} !important;
            }
            .fixed-top .btn-outline-primary .text-primary {
                color: {{ $currentDepartment->theme_color }} !important;
            }
            .navbar-brand .department-name {
                color: #FFFFFF !important;
                text-shadow: 0 1px 4px rgba(0, 0, 0, .5);
            }
        </style>
    @endif

    @stack('styles')
</head>
<body>

@include('partials.navbar')

@yield('content')

@include('partials.footer')

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/countup.js@2.0.7/dist/countUp.min.js"></script>
<script src="{{ asset('lib/wow/wow.min.js') }}"></script>
<script src="{{ asset('lib/easing/easing.min.js') }}"></script>
<script src="{{ asset('lib/waypoints/waypoints.min.js') }}"></script>
<script src="{{ asset('lib/owlcarousel/owl.carousel.min.js') }}"></script>
<script src="{{ asset('lib/parallax/parallax.min.js') }}"></script>
<script src="{{ asset('theme-js/main.js') }}"></script>

@stack('scripts')
</body>
</html>
