import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_task/core/routes/app_pages.dart';
import 'package:test_task/core/theme/app_theme.dart';
import 'package:test_task/global_dependency.dart';

void main() {
  GlobalDependency.init();
  WidgetsFlutterBinding.ensureInitialized();
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
      getPages: AppPages.pages,
      initialRoute: '/products',
    );
  }
}
