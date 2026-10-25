import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo({
    required this.name,
    DateTime? createdAt,
    this.updateAt,
    String? id,
    String? description,
    bool? isCompleted,
  }) : isCompleted = isCompleted ?? false,
       createdAt = createdAt ?? DateTime.now(),
       description = description == null || description == ''
           ? 'No description'
           : description,
       id = id ?? uuid.v4();

  final String id;
  final String name;
  final String description;
  final bool isCompleted;
  final DateTime? updateAt;
  final DateTime createdAt;

  Todo copyWith({
    String? name,
    String? description,
    String? updatedAt,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updateAt: DateTime.now(),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> data) {
    if (data['id'] is! String) {
      FormatException('Invalid id format ${data['id']}');
    }

    final id = data['id'] as String;

    if (data['name'] is! String) {
      FormatException('Invalid name format ${data['name']}');
    }

    final String name = data['name'] as String;

    if (data['description'] is! String) {
      FormatException('Invalid description format ${data['description']}');
    }

    final String? description = data['description'] as String?;

    if (data['createdAt'] is! String) {
      FormatException('Invalid createAt fromat ${data['createdAt']}');
    }

    final DateTime createdAt = DateTime.parse(data['createdAt'] as String);

    return Todo(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}
