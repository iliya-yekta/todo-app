import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_app/core/models/user.dart';

class UserProviderNotifier extends StateNotifier<User> {
  UserProviderNotifier()
    : super(User(userName: null, email: null, password: null));

  void build(String userName, String email, String password) {
    state = User(userName: userName, email: email, password: password);
  }
}

final userProvider =
    StateNotifierProvider.autoDispose<UserProviderNotifier, User>(
      (ref) => UserProviderNotifier(),
    );
