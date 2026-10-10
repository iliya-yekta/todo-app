import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/provider/todos_provider.dart';
import 'package:todo_app/core/provider/user_provider.dart';
import 'package:todo_app/features/add_todo/view/add_todo_screen.dart';
import 'package:todo_app/features/profile/view/profile_screen.dart';
import 'package:todo_app/features/todo/view/todo_item.dart';
import 'package:todo_app/features/todo/view_models/todo_view_model.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  final TodoViewModel _todoViewModel = TodoViewModel();

  void _removeTask(String id) {
    _todoViewModel.removeTask(ref, id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task has been removed successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final todoList = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddTodoScreen()));
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
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
              'Welcome ${user.userName}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: todoList.isEmpty
                ? Center(child: Text('Theres no task. Add new one.'))
                : ListView.separated(
                    itemBuilder: (context, index) => TodoItem(
                      todo: todoList[index],
                      onRemoveTask: _removeTask,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: todoList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
