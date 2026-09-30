import 'package:intl/intl.dart';
import 'package:todo_app/core/data/sample_data.dart';
import 'package:todo_app/core/models/todo.dart';

final format = DateFormat.yMd();

class TodoViewModel {
  TodoViewModel();

  String dtFormatter(DateTime dt) {
    return format.format(dt);
  }

  void removeTask(Todo t) {
    todoList.removeWhere((todo) => todo.id == t.id);
  }
}
