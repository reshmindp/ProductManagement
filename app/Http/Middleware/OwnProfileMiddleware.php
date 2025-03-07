<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class OwnProfileMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = auth()->user();
        $userId = $request->route('user');

        if ($userId instanceof \App\Models\User) {
            $userId = $userId->id;
        }
        
        if ($user->isAdmin() || $user->id == $userId) {
            return $next($request);
        }

        return response()->json(['error' => 'Unauthorized. You can only update your own profile.']);
    }
}
