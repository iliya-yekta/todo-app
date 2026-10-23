import 'package:uuid/uuid.dart';

const uuid = Uuid();

class User {
  User({required this.userName, required this.email, required this.password});

  final String id = uuid.v4();
  final String? userName;
  final String? email;
  final String? password;
  final DateTime dateTime = DateTime.now();
}
