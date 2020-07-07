import 'package:flutter/material.dart';
import 'package:testing_app/screens/login_screen.dart';
import 'package:testing_app/screens/main_screen.dart';
import 'package:testing_app/screens/signup_screen.dart';
import 'screens/initial_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hintColor: Colors.white,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => InitialPage(),
        "/login": (context) => LogInScreen(),
        "/signup": (context) => SignUpScreen(),
        "/main": (context) => MainScreen(),
      },
    );
  }
}
