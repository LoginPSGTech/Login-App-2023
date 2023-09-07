import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppDataProvider(),
        child: MaterialApp(
          title: 'Login App',
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
          },
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
          ),
          home: const MainPage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
