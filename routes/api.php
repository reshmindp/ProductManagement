<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::middleware('throttle:30,1')->group(function () { 
Route::get('products', [ProductController::class, 'index']); 
Route::get('products/{product}', [ProductController::class, 'show']);
Route::get('/product/top-ordered', [ProductController::class, 'topOrdered']);
Route::get('/product/in-stock', [ProductController::class, 'inStockProducts']);

Route::get('categories', function () {
    return Cache::remember('categories_list', 60 * 60, function () {
        return response()->json(\App\Models\Category::all());
    });
});

});

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('products', ProductController::class)->except(['index', 'show']);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::middleware('admin')->group(function () {
        Route::get('/users', [UserController::class, 'index']);  
        Route::post('/users', [UserController::class, 'store']);  
        Route::delete('/users/{user}', [UserController::class, 'destroy']);  
    });

    Route::middleware('own.profile')->group(function () {
        Route::put('/users/{user}', [UserController::class, 'update']);
    });
});
