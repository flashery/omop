<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">

	    <!-- CSRF Token -->
	    <meta name="csrf-token" content="{{ csrf_token() }}">

	    <title>{{ config('app.name') }}</title>

	    <!-- Styles -->
	    <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="app">
            <header-component @set-products="setProducts" :order="order" :products="products"></header-component>
            <example-component  @add-item="addItem" :products="products"></example-component>
            <checkout-component change-payment-method="changePaymentMethod" @has-discount="hasDiscount" :products="products" :order="order"></checkout-component>
        </div>
        <script src="{{ mix('js/app.js') }}"></script>
    </body>
</html>
