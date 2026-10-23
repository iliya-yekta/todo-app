import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/router/router.dart';

import 'package:todo_app/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: theme,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
