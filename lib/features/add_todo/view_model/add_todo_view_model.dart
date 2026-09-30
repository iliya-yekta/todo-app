import 'package:todo_app/core/data/sample_data.dart';
import 'package:todo_app/core/models/todo.dart';

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
  void addNewTask(String name, String? description) {
    todoList.add(Todo(name: name, description: description));
  }
}
