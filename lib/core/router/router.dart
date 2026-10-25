import 'package:go_router/go_router.dart';
import 'package:todo_app/features/add_todo/view/add_todo_screen.dart';
import 'package:todo_app/features/auth/view/auth_screen.dart';
import 'package:todo_app/features/edit_todo/view/edit_todo_screen.dart';
import 'package:todo_app/features/profile/view/profile_screen.dart';
import 'package:todo_app/features/todo/view/todo_detail.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

final router = GoRouter(
  initialLocation: '/todo',
  routes: <RouteBase>[
    GoRoute(path: '/auth', builder: (context, state) => AuthScreen()),
    GoRoute(
      path: '/todo',
      builder: (context, state) => TodoScreen(),
      routes: [
        GoRoute(
          path: '/todo_detail/:todoId',
          builder: (context, state) =>
              TodoDetail(id: state.pathParameters['todoId']!),
        ),
        GoRoute(
          path: '/todo_edit/:todoId',
          builder: (context, state) =>
              EditTodoScreen(id: state.pathParameters['todoId']!),
        ),
        GoRoute(path: '/todo_add', builder: (context, state) => AddTodoScreen())
      ],
    ),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  ],
);
