import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/provider/todos_provider.dart';

class EditTodoViewModel {
  //! Validator
  bool isNameTaskNull(String? name) {
    return name == null || name == '';
  }

  //? logic
  void submitEditTask(
    WidgetRef ref,
    String id,
    String name,
    String description,
  ) {
    ref.watch(todoProvider.notifier).editTodo(id, name, description);
  }
}
