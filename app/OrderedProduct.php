<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderedProduct extends Model
{
    protected $table = 'ordered_product';
    protected $fillable = [
        'order_id',
    ];
}
