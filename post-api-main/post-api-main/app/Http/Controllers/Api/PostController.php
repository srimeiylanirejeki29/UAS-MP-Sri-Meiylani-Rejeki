<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::all();
        return response()->json([
            'success' => true,
            'message' => 'Posts retrieved successfully',
            'data' => $posts
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string|max:255',
        ]);

        $post = Post::create($request->all());

        return response()->json([
            'success' => true,
            'message' => 'Post created successfully',
            'data' => $post
        ], 201);
    }

    public function show($id)
    {
        $post = Post::find($id);

        if (is_null($post)) {
            return response()->json([
                'success' => false,
                'message' => 'Post not found'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Post retrieved successfully',
            'data' => $post
        ]);
    }

    public function update(Request $request, $id)
    {
        $post = Post::find($id);

        if (is_null($post)) {
            return response()->json([
                'success' => false,
                'message' => 'Post not found'
            ], 404);
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string|max:255',
        ]);

        $post->update($request->all());

        return response()->json([
            'success' => true,
            'message' => 'Post updated successfully',
            'data' => $post
        ]);
    }

    public function destroy($id)
    {
        $post = Post::find($id);

        if (is_null($post)) {
            return response()->json([
                'success' => false,
                'message' => 'Post not found'
            ], 404);
        }

        $post->delete();

        return response()->json([
            'success' => true,
            'message' => 'Post deleted successfully'
        ], 204);
    }
}
