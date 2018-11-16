<?php

namespace App\Http\Controllers\Api;

use App\Coupon;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CounponController extends Controller
{
    public function redeemCode(Request $request)
    {
        $coupon = Coupon::where('code', $request->coupon_code)->get();
        return response()->json($coupon);
    }
}
