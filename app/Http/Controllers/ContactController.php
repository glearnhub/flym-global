<?php

namespace App\Http\Controllers;

use App\Models\ContactMessage;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ContactController extends Controller
{
    public function show(): View
    {
        return view('contact.show');
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'department_id' => ['nullable', 'exists:departments,id'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255'],
            'phone' => ['nullable', 'string', 'max:50'],
            'message' => ['required', 'string', 'max:5000'],
        ]);

        ContactMessage::create($validated);

        return back()->with('status', 'Thanks for reaching out! We will get back to you soon.');
    }
}
