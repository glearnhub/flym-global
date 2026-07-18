<?php

use App\Http\Controllers\ContactController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\GalleryController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\NewsController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/about', [HomeController::class, 'about'])->name('about');

Route::get('/departments', [DepartmentController::class, 'index'])->name('departments.index');

Route::get('/events', [EventController::class, 'index'])->name('events.index');
Route::get('/news', [NewsController::class, 'index'])->name('news.index');
Route::get('/gallery', [GalleryController::class, 'index'])->name('gallery.index');

Route::get('/donate', fn () => view('donate'))->name('donate');

Route::get('/contact', [ContactController::class, 'show'])->name('contact.show');
Route::post('/contact', [ContactController::class, 'store'])->name('contact.store');

// Each department gets its own mini-site at /{slug}, with its own sub-nav
// (Home/Events/Gallery/Team). Kept last so it never shadows the fixed
// top-level routes above.
Route::prefix('{department:slug}')->name('department.')->group(function () {
    Route::get('/', [DepartmentController::class, 'home'])->name('home');
    Route::get('/events', [DepartmentController::class, 'events'])->name('events');
    Route::get('/gallery', [DepartmentController::class, 'gallery'])->name('gallery');
    Route::get('/team', [DepartmentController::class, 'team'])->name('team');
});
