import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(Todo) onToggleTodo;

  const TodoList({
    super.key,
    required this.todos,
    required this.onToggleTodo,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(
          todo: todos[index],
          onChanged: (value) {
            onToggleTodo(todos[index]);
          },
        );
      },
    );
  }
}
