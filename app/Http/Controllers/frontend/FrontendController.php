<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index()
    {
        return redirect('/adminpnlx');
    }

    public function privacyPolicy()
    {
        $CmsPage = \App\Models\Cms::where('slug', 'privacy-policy')->first();
        if (!$CmsPage) {
            abort(404);
        }
        return view('frontend.privacy-policy', compact('CmsPage'));
    }

    public function termsConditions()
    {
        $CmsPage = \App\Models\Cms::where('slug', 'term-conditions')->first();
        if (!$CmsPage) {
            abort(404);
        }
        return view('frontend.terms-conditions', compact('CmsPage'));
    }

    public function dataDeletion()
    {
        return view('frontend.data-deletion');
    }
}
