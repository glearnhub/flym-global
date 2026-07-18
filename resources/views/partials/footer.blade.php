<div class="container-fluid bg-dark text-white-50 footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6">
                <h5 class="text-light mb-4">Address</h5>
                <p><i class="fa fa-map-marker-alt me-3"></i>P.O BOX 61908, Nairobi, KENYA</p>
                <p><i class="fa fa-phone-alt me-3"></i>+254704900700</p>
                <p><i class="fa fa-envelope me-3"></i>info@flym-global.org</p>
                <div class="d-flex pt-2">
                    <a class="text-white-50 me-3" href="https://web.facebook.com/IAmInFlyM/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a class="text-white-50 me-3" href="https://x.com/FlyM2019" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a class="text-white-50 me-3" href="https://www.youtube.com/@fly-mchannel1592" target="_blank"><i class="fab fa-youtube"></i></a>
                    <a class="text-white-50 me-3" href="https://www.instagram.com/ministryflym" target="_blank"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h5 class="text-light mb-4">Quick Links</h5>
                <a class="btn btn-link" href="{{ route('about') }}">About Us</a>
                <a class="btn btn-link" href="{{ route('departments.index') }}">Departments</a>
                <a class="btn btn-link" href="{{ route('contact.show') }}">Contact Us</a>
                <a class="btn btn-link" href="{{ route('donate') }}">Support</a>
            </div>
            <div class="col-lg-4 col-md-6">
                <h5 class="text-light mb-4">Newsletter</h5>
                <p>Be the first to know about our latest outreach programs</p>
                <div class="position-relative mx-auto" style="max-width: 400px">
                    <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email" />
                    <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; {{ now()->year }} <a href="{{ route('home') }}">Fly-M Global</a>, All Rights Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    Designed By <a href="https://wa.me/254702499324" target="_blank">ZerCassia Tech</a>
                </div>
            </div>
        </div>
    </div>
</div>

<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
