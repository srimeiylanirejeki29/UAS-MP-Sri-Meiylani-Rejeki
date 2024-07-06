import 'package:flutter/material.dart';
import 'post_list_screen.dart'; // Ensure this import matches the actual file name

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostListScreen(), // Updated to show PostListScreen as the home screen
    );
  }
}
