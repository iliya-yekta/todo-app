import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/provider/todos_provider.dart';

class AddTodoViewModel {
  //! Validator
  bool isNameEmpty(String? name) {
    if (name == '' || name == null) return true;
    return false;
  }

  bool hasNameValidLength(String name) {
    if (name.length <= 20 && name.length >= 3) return true;
    return false;
  }

  //? Logic
  void addNewTask(WidgetRef ref, {required String name, String? description}) {
    ref.watch(todoProvider.notifier).addTodo(Todo(name: name, description: description));
  }
}
