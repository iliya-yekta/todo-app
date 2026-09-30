import 'package:flutter/material.dart';
import 'package:todo_app/core/models/user.dart';
import 'package:todo_app/features/auth/view_model/auth_view_model.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthViewModel _authViewModel = AuthViewModel();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              TextFormField(
                validator: (value) => _authViewModel.isUsernameValid(value),
                decoration: InputDecoration(label: Text('Username')),
                controller: _usernameController,
              ),
              TextFormField(
                validator: (value) => _authViewModel.isEmailValid(value),
                decoration: InputDecoration(label: Text('Email')),
                controller: _emailController,
              ),
              TextFormField(
                validator: (value) => _authViewModel.isPasswordValid(value),
                decoration: InputDecoration(label: Text('Password')),
                controller: _passwordController,
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => TodoScreen(
                          user: User(
                            userName: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Account has been created successfully'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
