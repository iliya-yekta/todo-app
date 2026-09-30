class User {
  const User({
    required this.userName,
    required this.email,
    required this.password,
    this.dateTime,
  });

  final String userName;
  final String email;
  final String password;
  final DateTime? dateTime;
}
