<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::middleware('api')->get('/products', "Api\ProductController@all");
Route::middleware('api')->get('/products/getcat/', "Api\ProductController@getCategories");
Route::middleware('api')->post('/products/bycat/', "Api\ProductController@byCategory");
Route::middleware('api')->post('/redeem-code', "Api\CounponController@redeemCode");
Route::middleware('api')->post('/order', "Api\OrderController@add");
