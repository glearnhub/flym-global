<?php

namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\View\View;

class DepartmentController extends Controller
{
    public function index(): View
    {
        return view('departments.index', [
            'departments' => Department::query()->where('is_active', true)->orderBy('sort_order')->get(),
        ]);
    }

    public function home(Department $department): View
    {
        $department->load([
            'leaders' => fn ($query) => $query->orderBy('sort_order'),
            'leaders.position',
            'events' => fn ($query) => $query->orderByDesc('event_date')->limit(3),
            'galleryPhotos' => fn ($query) => $query->orderBy('sort_order')->limit(8),
        ]);

        return view('departments.home', ['department' => $department]);
    }

    public function events(Department $department): View
    {
        $department->load([
            'events' => fn ($query) => $query->orderByDesc('event_date'),
        ]);

        return view('departments.events', ['department' => $department]);
    }

    public function gallery(Department $department): View
    {
        $department->load([
            'galleryPhotos' => fn ($query) => $query->orderBy('sort_order'),
        ]);

        return view('departments.gallery', ['department' => $department]);
    }

    public function team(Department $department): View
    {
        $department->load([
            'leaders' => fn ($query) => $query->orderBy('sort_order'),
            'leaders.position',
        ]);

        return view('departments.team', ['department' => $department]);
    }
}
