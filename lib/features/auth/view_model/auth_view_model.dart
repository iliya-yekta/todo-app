class AuthViewModel {
  const AuthViewModel();

  String? isUsernameValid(String? username) {
    if (username == null || username.isEmpty) {
      return 'Please enter your username.';
    } else if (username.length <= 3 || username.length >= 20) {
      return 'Enter your username in between 3 and 20 characters.';
    }
    return null;
  }

  String? isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email.';
    } else if (!email.contains(
      RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+$'),
    )) {
      return 'Please enter valid email address.';
    }

    return null;
  }

  String? isPasswordValid(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'Please enter your password.';
    } else if (!(pass.length >= 10 && pass.length <= 25)) {
      return 'Enter your password in between 10 and 25 characters.';
    } else if (!pass.contains(RegExp(r'[!@#$%^&*]'))) {
      return 'Use symbol characters.';
    } else if (!pass.contains(RegExp(r'\d+'))) {
      return 'Use numbers.';
    } else if (!pass.contains(RegExp('[a-zA-Z]'))) {
      return 'Use characters in your password';
    }

    return null;
  }
}
