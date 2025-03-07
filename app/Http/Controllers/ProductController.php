<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{

    public function __construct()
    {
        $this->middleware('admin')->except(['index', 'show','inStockProducts','topOrdered']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Product::with('category');

        if ($request->has('category_id')) {
            $query->where('category_id', $request->category_id);
        }

        $products = $query->paginate(10);
        return response()->json($products);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = Validator::make($request->all(), 
                            ['name' => 'required',
                            'price' => 'required|numeric|min:0',
                            'category_id' => 'required|exists:categories,id',
                            'description' => 'nullable|string|min:0',
                            'stock_quantity' => 'required|integer',
                            'image' => 'nullable|image|mimes:jpeg,png|max:2048'
        ]);

        if($validated->fails())
        {
            return response()->json(['status' => false, 'message' => 'Validation Error', 'errors' => $validated->errors()]);
        }

        $formdata = request()->all();

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('products', 'public');
            $formdata['image_path'] = $imagePath;
        }

        $formdata['created_by'] = auth()->id();
        $product = Product::create($formdata);

        return response()->json(['status'=>true, 'message' => 'Product created successfully', 'product' => $product]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        return response()->json($product->load('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $validated = Validator::make($request->all(), [
            'name' => 'sometimes|string|max:255',
            'price' => 'sometimes|numeric|min:0',
            'category_id' => 'sometimes|exists:categories,id',
            'description' => 'nullable|string',
            'stock_quantity' => 'sometimes|integer|min:0',
            'image' => 'nullable|image|mimes:jpeg,png|max:2048'
        ]);

        $formdata = $request->all();

        if ($request->hasFile('image')) {
            
            if ($product->image_path) {
                Storage::disk('public')->delete($product->image_path);
            }

            $formdata['image_path'] = $request->file('image')->store('products', 'public');
        }

        $product->update($formdata);

        return response()->json(['status'=>true, 'message' => 'Product updated successfully', 'product' => $product]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        if ($product->image_path) {
            Storage::disk('public')->delete($product->image_path);
        }
        
        $product->delete();

        return response()->json(['message' => 'Product deleted successfully']);
    }

    public function topOrdered()
    {
        $topProducts = Product::mostOrdered()->get();
        return response()->json($topProducts);
    }

    public function inStockProducts()
    {
        $products = Product::inStock()->get();
        return response()->json($products);
    }
}
