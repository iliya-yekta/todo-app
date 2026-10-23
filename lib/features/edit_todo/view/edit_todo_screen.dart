import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/provider/todos_provider.dart';
import 'package:todo_app/core/widgets/task_form_container.dart';
import 'package:todo_app/features/edit_todo/view_model/edit_todo_view_model.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

class EditTodoScreen extends ConsumerStatefulWidget {
  const EditTodoScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends ConsumerState<EditTodoScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  final EditTodoViewModel _editTodoViewModel = EditTodoViewModel();
  Todo? todo;

  @override
  void initState() {
    todo = ref.watch(todoProvider.notifier).findTodo(widget.id);
    _nameController = TextEditingController(text: todo!.name);
    _descriptionController = TextEditingController(text: todo!.description);

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitEdit() {
    if (_editTodoViewModel.isNameTaskNull(_nameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Try to write the name of the task...')),
      );
      return;
    }

    // prevent from push back
    context.go('/todo');

    _editTodoViewModel.submitEditTask(
      ref,
      todo!.id,
      name: _nameController.text,
      description: _descriptionController.text,
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Task has been changed')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editing mode')),
      body: TaskFormContainer(
        widgets: [
          Text('Editing task'),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(label: Text('Task Name: ')),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(label: Text('Description task')),
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: _submitEdit, child: Text('Submit')),
        ],
      ),
    );
  }
}
