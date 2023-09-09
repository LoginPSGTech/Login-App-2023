import 'package:flutter/material.dart';
import 'package:login/api/api.dart';
import 'package:login/api/user.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Future<bool> checkLogin() async {
    try {
      await UserApi.getUser();
    } on APIException {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppDataProvider(),
        child: FutureBuilder<bool>(
            future: checkLogin(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data as bool == true) {
                  return MaterialApp(
                    title: 'Login App',
                    initialRoute: '/home',
                    routes: {'/login': (context) => const LoginPage(), '/home': (context) => const MainPage()},
                    theme: ThemeData(
                      useMaterial3: true,
                      fontFamily: 'Poppins',
                    ),
                    debugShowCheckedModeBanner: false,
                  );
                } else {
                  return MaterialApp(
                    title: 'Login App',
                    initialRoute: '/login',
                    routes: {'/login': (context) => const LoginPage(), '/home': (context) => const MainPage()},
                    theme: ThemeData(
                      useMaterial3: true,
                      fontFamily: 'Poppins',
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
