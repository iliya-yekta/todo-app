import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/core/widgets/task_form_container.dart';
import 'package:todo_app/features/add_todo/view_model/add_todo_view_model.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final AddTodoViewModel _addTodoViewModel = AddTodoViewModel();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
  }

  void _submitAddTask() {
    if (_addTodoViewModel.isNameEmpty(_nameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Try to add some text for task name')),
      );
      return;
    } else if (!_addTodoViewModel.hasNameValidLength(_nameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Try to name a task with valid quantity character'),
        ),
      );
      return;
    }

    context.go('/todo');

    _addTodoViewModel.addNewTask(
      ref,
      name: _nameController.text,
      description: _descriptionController.text,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Task has been added successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: TaskFormContainer(
        widgets: [
          TextField(
            maxLength: 20,
            decoration: InputDecoration(label: Text('Task Name: ')),
            controller: _nameController,
          ),
          const SizedBox(height: 24),
          TextField(
            maxLength: 20,
            decoration: InputDecoration(label: Text('Description: ')),
            controller: _descriptionController,
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: _submitAddTask, child: Text('Submit')),
        ],
      ),
    );
  }
}
