import 'package:flutter/material.dart';

import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/models/user.dart';
import 'package:todo_app/core/widgets/task_form_container.dart';
import 'package:todo_app/features/edit_todo/view_model/edit_todo_view_model.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({super.key, required this.todo, required this.user});

  final Todo todo;
  final User user;

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  final EditTodoViewModel _editTodoViewModel = EditTodoViewModel();

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.todo.name);
    _descriptionController = TextEditingController(
      text: widget.todo.description,
    );
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
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => TodoScreen(user: widget.user)),
      (route) => false,
    );
    _editTodoViewModel.submitEditTask(
      widget.todo,
      _nameController.text,
      _descriptionController.text,
    );
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
