import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String typedText = '';
  List<String> todos = [];
  bool darkMode = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          //backgroundColor: const Color.fromARGB(255, 4, 0, 255),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Add a todo',
                        //hintText: 'e.g. Go Shopping ...'
                        //suffixIcon: Icon(Icons.add)
                        //filled: true,
                        //fillColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onChanged: (value) {
                        setState(() {
                          typedText = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (typedText.isNotEmpty) {
                        setState(() {
                          todos.add(typedText);
                          typedText = '';
                          _controller.clear();
                        });
                      }
                    },
                    child: const Text('ADD'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Card( // Card instead of ListTile
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(todos[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}