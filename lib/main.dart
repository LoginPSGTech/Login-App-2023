import 'package:flutter/material.dart';
import 'package:login/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}