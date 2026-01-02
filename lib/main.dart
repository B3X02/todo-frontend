import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: const TextField(
            decoration: const InputDecoration(
              labelText: 'Add a todo',
            ),
          ),
        ),
      ),
    );
  }
}