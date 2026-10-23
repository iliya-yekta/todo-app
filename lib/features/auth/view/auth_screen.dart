import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/provider/user_provider.dart';
import 'package:todo_app/features/auth/view_model/auth_view_model.dart';
import 'package:todo_app/features/todo/view/todo_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<ConsumerStatefulWidget> {
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
                    ref
                        .watch(userProvider.notifier)
                        .build(
                          _usernameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );

                    context.go('todo');
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
