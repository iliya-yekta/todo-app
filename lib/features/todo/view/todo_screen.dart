import 'package:flutter/material.dart';
import 'package:todo_app/core/data/sample_data.dart';
import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/models/user.dart';
import 'package:todo_app/features/add_todo/view/add_todo_screen.dart';
import 'package:todo_app/features/profile/view/profile_screen.dart';
import 'package:todo_app/features/todo/view/todo_item.dart';
import 'package:todo_app/features/todo/view_models/todo_view_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required this.user});

  final User user;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoViewModel _todoViewModel = TodoViewModel();

  void _removeTask(Todo todo) {
    setState(() {
      _todoViewModel.removeTask(todo);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task has been removed successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddTodoScreen(user: widget.user),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: widget.user),
                ),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Welcome ${widget.user.userName}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => TodoItem(
                todo: todoList[index],
                onRemoveTask: _removeTask,
                user: widget.user,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: todoList.length,
            ),
          ),
        ],
      ),
    );
  }
}
