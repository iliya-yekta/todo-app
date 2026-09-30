import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme colorTheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 216, 119, 40),
);

final theme = ThemeData().copyWith(
  colorScheme: colorTheme,
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: colorTheme.primary,
    foregroundColor: colorTheme.onPrimary,
  ),
);
