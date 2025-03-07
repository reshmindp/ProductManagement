<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Category;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->word(),
            'price' => $this->faker->randomFloat(2, 10, 500),
            'category_id' => Category::inRandomOrder()->first()->id ?? Category::factory(),
            'description' => $this->faker->sentence(),
            'stock_quantity' => $this->faker->numberBetween(1, 100),
            'created_by' => User::where('role', 'admin')->inRandomOrder()->first()->id ?? User::factory(),
            'image_path' => 'public/assets/images/product.png',
        ];
    }
}
