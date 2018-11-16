<?php

namespace App\Http\Controllers\Api;

use App\Category;
use App\Http\Controllers\Controller;
use App\ProductView;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function getCategories()
    {
        $categories = Category::all();
        return response()->json($categories);
    }

    public function single(Request $request)
    {
        $product = ProductView::where('product_id', $request->get('product_id'));
        return response()->json($product);
    }

    public function byCategory(Request $request)
    {
        $products = ProductView::where('category_id', $request->category_id)->get();
        return response()->json($products);
    }

    public function all(Request $request)
    {
        $products = ProductView::all();
        return response()->json($products);
    }
}
