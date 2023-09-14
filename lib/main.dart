import 'package:flutter/material.dart';
import 'package:login/api/api.dart';
import 'package:login/api/user.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'models/user.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = const Color(0xFFF55353)
    ..backgroundColor = const Color(0xFF143F6B)
    ..indicatorColor = const Color(0xFFF55353)
    ..textColor = Colors.white
    ..maskColor = Colors.black12
    ..userInteractions = true
    ..dismissOnTap = false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<UserModel?> checkLogin() async {
      try {
        return await UserApi.getUser(context);
      } on ApiException {
        return null;
      }
    }

    return ChangeNotifierProvider(
        create: (context) => AppDataProvider(),
        child: FutureBuilder<UserModel?>(
            future: checkLogin(),
            builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  Provider.of<AppDataProvider>(context, listen: false).saveUser(snapshot.data!);
                  return MaterialApp(
                    title: 'Login App',
                    initialRoute: '/home',
                    routes: {'/login': (context) => const LoginPage(), '/home': (context) => const MainPage()},
                    theme: ThemeData(
                      useMaterial3: true,
                      fontFamily: 'Poppins',
                    ),
                    debugShowCheckedModeBanner: false,
                    builder: EasyLoading.init(),
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
                    builder: EasyLoading.init(),
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
