import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_app/core/data/sample_data.dart';
import 'package:todo_app/core/models/todo.dart';

class TodosProvider extends StateNotifier<List<Todo>> {
  TodosProvider() : super(todoList);

  void addTodo(String name, String? description) {
    state = [...state, Todo(name: name, description: description)];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void editTodo(String id, {String? name, String? description}) {
    final todoIndex = state.indexWhere((todo) => todo.id == id);

    state = [
      ...state.sublist(0, todoIndex),
      state
          .firstWhere((todo) => todo.id == id)
          .copyWith(name: name, description: description),
      ...state.sublist(todoIndex + 1, state.length),
    ];
  }

  Todo findTodo(String id) {
    return state.firstWhere((todo) => todo.id == id);
  }
}

final todoProvider = StateNotifierProvider((ref) => TodosProvider());
