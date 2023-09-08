import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';

import 'api/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppDataProvider(),
        child: FutureBuilder<bool>(
            future: AuthApi.checkLogin(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data as bool == true) {
                  return MaterialApp(
                    title: 'Login App',
                    initialRoute: '/login',
                    routes: {'/login': (context) => const LoginPage(), '/home': (context) => const MainPage()},
                    theme: ThemeData(
                      useMaterial3: true,
                    fontFamily: 'Poppins',),
                    debugShowCheckedModeBanner: false,
                  );
                } else {
                  return MaterialApp(
                    title: 'Login App',
                    initialRoute: '/login',
                    routes: {'/login': (context) => const LoginPage(), '/home': (context) => const MainPage()},
                    theme: ThemeData(
                      useMaterial3: true,
                      fontFamily: 'Poppins',),
                    ),
                    debugShowCheckedModeBanner: false,
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
