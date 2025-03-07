<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Order;
use App\Models\Product;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\OrderProduct>
 */
class OrderProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),  
            'product_id' => Product::factory(),  
            'quantity' => $this->faker->numberBetween(1, 5),
            'price_at_order' => $this->faker->randomFloat(2, 10, 500),
        ];
    }
}
