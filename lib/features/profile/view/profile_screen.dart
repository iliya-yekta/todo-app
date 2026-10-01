import 'package:flutter/material.dart';
import 'package:todo_app/core/models/user.dart';
import 'package:todo_app/features/profile/widgets/custom_text_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile page')),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/image.png', height: 200),
              const SizedBox(height: 12),
              CustomTextContainer(
                textLabel: 'username:',
                textInput: user.userName,
              ),
              CustomTextContainer(textLabel: 'Email: ', textInput: user.email),
              CustomTextContainer(
                textLabel: 'password: ',
                textInput: user.password,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
