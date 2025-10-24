import 'package:client/core/theme/theme.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raagam Music App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// main.dart
