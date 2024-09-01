import 'dart:ui' show Color;

import 'package:deez_notes/model/todo_model.dart';
import 'package:intl/intl.dart';

class Note {
  final String? id;
  final String? title;
  final String? description;
  final Color? color;
  final DateTime? dateTime;
  final List<Todo> todos;

  Note({
    this.id,
    this.title,
    this.description,
    this.color,
    this.dateTime,
    List<Todo>? todos,
  }) : todos = todos ?? [];

  final DateFormat _formatter = DateFormat('MMMM dd, yyyy');
  String get date => dateTime != null ? _formatter.format(dateTime!) : '';

  final DateFormat _formatter1 = DateFormat('MMMM dd, yyyy  h:m a');
  String get dateWithTime =>
      dateTime != null ? _formatter1.format(dateTime!) : '';

  bool get hasTodo => todos.isNotEmpty;
}
