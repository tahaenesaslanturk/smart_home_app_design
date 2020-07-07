import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Center(
          child: Text(
            "WELCOME TO YOUR CONTROL SCREEN",
            style: TextStyle(
              fontFamily: "Oswald",
              fontSize: 60,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
