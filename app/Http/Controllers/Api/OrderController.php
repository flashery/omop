<?php

namespace App\Http\Controllers\Api;

use App\Customer;
use App\Http\Controllers\Controller;
use App\Order;
use App\OrderedProduct;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function add(Request $request)
    {
        $order = Order::create($request->all());

        // Get ONLY the customer object from request array
        $customer = object_get($request, 'customer');
        $customer['order_id'] = $order->id;
        Customer::create($customer);

        $products = object_get($request, 'products');

        foreach ($products as $product) {
            $product['order_id'] = $order->id;
            OrderedProduct::create($product);
        }

        return response()->json($customer);
    }
}
