import 'package:flutter/material.dart';
import 'package:todo_app/core/models/user.dart';
import 'package:todo_app/core/widgets/task_form_container.dart';
import 'package:todo_app/features/add_todo/view_model/add_todo_view_model.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, required this.user});

  final User user;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
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

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => TodoScreen(user: widget.user,)),
      (route) => false,
    );
    _addTodoViewModel.addNewTask(
      _nameController.text,
      _descriptionController.text,
    );
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
