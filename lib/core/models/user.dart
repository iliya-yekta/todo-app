class User {
  User({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;
  final DateTime dateTime = DateTime.now();
}
