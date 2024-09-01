import 'package:uuid/uuid.dart';

class Todo {
  final bool completed;
  final String? title;
  final String? id;

  Todo({
    this.completed = false,
    this.title,
    String? id,
  }) : id = id ?? const Uuid().v4();

  factory Todo.empty() {
    return Todo(
      id: const Uuid().v4(),
      title: '',
      completed: false,
    );
  }
}
