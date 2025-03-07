<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'price', 'category_id', 'description', 'stock_quantity', 'created_by', 'image_path'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function orders()
    {
        return $this->belongsToMany(Order::class,'order_products')->withPivot('quantity', 'price');
    }

    public function scopeInStock($query)
    {
        return $query->where('stock_quantity', '>', 0);
    }

    public function scopeMostOrdered(Builder $query, $limit = 5)
    {
        return $query->withCount('orders') 
            ->orderBy('orders_count', 'desc')
            ->limit($limit);
    }
}
