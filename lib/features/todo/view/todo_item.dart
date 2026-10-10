import 'package:flutter/material.dart';

import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/features/todo/view/todo_detail.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onRemoveTask,
  });

  final Todo todo;
  final void Function(String id) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoDetail(todoInfo: todo),
          ),
        );
      },
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
                    todo.description == ''
                        ? 'No description'
                        : todo.description,
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
