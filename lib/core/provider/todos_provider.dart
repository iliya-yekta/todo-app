import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/network/dio_client.dart';

class TodoProviderNotifier extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    final Response response = await dio.get('/todo');

    final data = response.data as List<dynamic>;

    List<Todo> result = data.map((data) {
      return Todo(
        id: data['id'],
        name: data['name'],
        description: data['description'],
      );
    }).toList();

    return result;
  }

  Future<void> addTodo(Todo todo) async {
    state = const AsyncLoading();

    await dio.post(
      '/todo',
      data: {
        'name': todo.name,
        'description': todo.description,
        'createdAt': todo.createdAt.toIso8601String(),
        'isCompleted': todo.isCompleted,
      },
    );

    final currentTodo = state.requireValue;

    state = AsyncData([...currentTodo, todo]);
  }

  Future<void> removeTodo(String id) async {
    state = const AsyncLoading();

    await dio.delete('/todo/$id');

    final currentTodo = state.requireValue;

    state = AsyncData([...currentTodo.where((todo) => todo.id != id)]);
  }

  Future<void> editTodo(String id, String name, String description) async {
    state = const AsyncLoading();

    await dio.put(
      '/todo/$id',
      data: {'name': name, 'description': description},
    );

    final currentTodo = state.requireValue;

    final int newTodoIndex = currentTodo.indexWhere((todo) => todo.id == id);

    final Todo newTodo = currentTodo
        .firstWhere((todo) => todo.id == id)
        .copyWith(name: name, description: description);

    state = AsyncData([
      ...currentTodo.sublist(0, newTodoIndex),
      newTodo,
      ...currentTodo.sublist(newTodoIndex + 1, currentTodo.length),
    ]);
  }

  Todo findTodo(String id) {
    return state.requireValue.firstWhere((todo) => todo.id == id);
  }
}

final todoProvider =
    AsyncNotifierProvider.autoDispose<TodoProviderNotifier, List<Todo>>(
      TodoProviderNotifier.new,
    );
