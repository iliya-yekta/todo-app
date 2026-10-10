import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/provider/user_provider.dart';
import 'package:todo_app/features/profile/widgets/custom_text_container.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
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
                textInput: user.userName!,
              ),
              CustomTextContainer(textLabel: 'Email: ', textInput: user.email!),
              CustomTextContainer(
                textLabel: 'password: ',
                textInput: user.password!,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
