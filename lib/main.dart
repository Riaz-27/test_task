import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_task/app_routes.dart';
import 'package:test_task/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task',
      theme: AppTheme.lightThemeMode,
      getPages: AppRoutes.routes,
    );
  }
}
