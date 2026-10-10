import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/provider/todos_provider.dart';

final format = DateFormat.yMd();

class TodoViewModel {
  TodoViewModel();

  String dtFormatter(DateTime dt) {
    return format.format(dt);
  }

  void removeTask(WidgetRef ref, String id) {
    ref.watch(todoProvider.notifier).removeTodo(id);
  }
}
