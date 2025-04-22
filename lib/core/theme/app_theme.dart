import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_palette.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2),
    borderRadius: BorderRadius.circular(15),
  );
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.whiteColor,
    indicatorColor: AppPalette.accentColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppPalette.accentColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      enabledBorder: _border(AppPalette.borderColor),
      focusedBorder: _border(AppPalette.accentColor),
    ),
  );
}
