<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\View\View;

class EventController extends Controller
{
    public function index(): View
    {
        return view('events.index', [
            'events' => Event::with('department')
                ->where('event_date', '>=', now()->toDateString())
                ->orderBy('event_date')
                ->get(),
        ]);
    }
}
