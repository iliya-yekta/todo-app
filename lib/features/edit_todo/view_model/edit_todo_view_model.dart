import 'package:todo_app/core/data/sample_data.dart';
import 'package:todo_app/core/models/todo.dart';

class EditTodoViewModel {
  //! Validator
  bool isNameTaskNull(String? name) {
    return name == null || name == '';
  }

  //? logic
  void submitEditTask(Todo todoTask, String? name, String? description) {
    final indexTodo = todoList.indexWhere((todo) => todo.id == todoTask.id);

    if (isNameTaskNull(name)) return;

    todoList[indexTodo] = todoTask.copyWith(
      name: name,
      description: description,
    );
  }
}
