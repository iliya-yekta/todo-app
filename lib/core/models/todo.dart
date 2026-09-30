import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo({required this.name, description, this.updateAt})
    : isCompleted = false, description = description == '' ? 'No description' : description;

  final String id = uuid.v4();
  final String name;
  final String description;
  final bool isCompleted;
  final DateTime createdAt = DateTime.now();
  final DateTime? updateAt;

  Todo copyWith({String? name, String? description, String? updatedAt}) {
    return Todo(
      name: name ?? this.name,
      description: description ?? this.description,
      updateAt: DateTime.now(),
    );
  }
}
