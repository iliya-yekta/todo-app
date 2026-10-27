import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/core/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.onRemoveTask});

  final Todo todo;
  final void Function(String id) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/todo/todo_detail/${todo.id}'),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.name),
                  Text(
                    todo.description!
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  onRemoveTask(todo.id);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
