import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final DateTime date;
  bool completed;

  Todo({
    required this.title,
    required this.completed,
    DateTime? date,
  })  : id = const Uuid().v4(),
        date = date ?? DateTime.now();
}