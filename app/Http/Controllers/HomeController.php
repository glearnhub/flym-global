<?php

namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\View\View;

class HomeController extends Controller
{
    public function index(): View
    {
        return view('home', [
            'departments' => Department::query()->where('is_active', true)->orderBy('sort_order')->get(),
        ]);
    }

    public function about(): View
    {
        return view('about');
    }
}
