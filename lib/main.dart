import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/features/auth/view/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      home: AuthScreen(),
      theme: theme,
      debugShowCheckedModeBanner: false,
    ),
  );
}
