<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'role' => 'required|in:admin,user'
        ]);

        if($validate->fails())
        {
            return response()->json(['status' => false, 'message' => 'Validation Error', 'errors' => $validate->errors()]);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role
        ]);

        return response()->json(['status'=>true, 'message'=>'Registration success!', 'token' => $user->createToken('API Token')->plainTextToken]);
    }

    public function login(Request $request)
    {
        $validate = Validator::make($request->all(), ['email' => 'required|email','password' => 'required']);

        if($validate->fails())
        {
            return response()->json(['status' => false, 'message' => 'Validation Error', 'errors' => $validate->errors()]);
        }
        
        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid login credentials']);
        }

        return response()->json(['status'=>true, 'token' => $user->createToken('API Token')->plainTextToken]);
    }

}
