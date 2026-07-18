<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\View\View;

class NewsController extends Controller
{
    public function index(): View
    {
        return view('news.index', [
            'news' => News::with('department')
                ->whereNotNull('published_at')
                ->where('published_at', '<=', now())
                ->orderByDesc('published_at')
                ->paginate(9),
        ]);
    }
}
