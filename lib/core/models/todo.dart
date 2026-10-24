import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo({String? id, required this.name, description, this.updateAt})
    : isCompleted = false,
      description = description == '' ? 'No description' : description,
      id = id ?? uuid.v4();

  final String id;
  final String name;
  final String description;
  final bool isCompleted;
  final DateTime createdAt = DateTime.now();
  final DateTime? updateAt;

  Todo copyWith({String? name, String? description, String? updatedAt}) {
    return Todo(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      updateAt: DateTime.now(),
    );
  }
}
