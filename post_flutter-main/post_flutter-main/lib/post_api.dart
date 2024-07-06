import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_flutter/post_model.dart';


class PostApi {
  final String baseUrl = 'http://192.168.1.4/api/posts';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> getPost(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(Post post) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${post.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}
