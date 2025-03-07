<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\Order;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory()->create(['name' => 'Admin', 'email' => 'admin@ecommerce.com', 'password' => Hash::make('password'), 'role' => 'admin']);
        User::factory(5)->create(['role' => 'user']);

        Category::factory(5)->create();
        $products = Product::factory(20)->create();
        Order::factory(10)->create()->each(function ($order) use ($products) {
            $order->products()->attach(
                $products->random(rand(1, 5))->pluck('id')->toArray(),
                [
                    'quantity' => rand(1, 5),
                    'price' => rand(100, 1000) / 10  
                ]
            );
        });
    }
}
