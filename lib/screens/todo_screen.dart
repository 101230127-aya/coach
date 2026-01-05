import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../widgets/todo_list.dart';
import '../widgets/new_todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = [];

  void _addTodo(String title) {
    setState(() {
      _todos.add(
        Todo(
          title: title,
          completed: false,
        ),
      );

      _todos.sort((a, b) {
        if (a.completed == b.completed) return 0;
        return a.completed ? 1 : -1;
      });
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;

      _todos.sort((a, b) {
        if (a.completed == b.completed) return 0;
        return a.completed ? 1 : -1;
      });
    });
  }

  void _openAddTodoModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewTodo(onAddTodo: _addTodo),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No tasks yet',
        style: TextStyle(fontSize: 18),
      ),
    );

    if (_todos.isNotEmpty) {
      mainContent = TodoList(
        todos: _todos,
        onToggleTodo: _toggleTodo,
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTodoModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
