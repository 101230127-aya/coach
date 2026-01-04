import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No tasks yet',
        style: TextStyle(fontSize: 18),
      ),
    );

    if (_todos.isNotEmpty) {
      mainContent = Column(
        children: const [
          Text('Todo list will go here'),
        ],
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
