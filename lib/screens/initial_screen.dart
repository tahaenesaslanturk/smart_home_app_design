import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/screens/login_screen.dart';
import 'package:testing_app/screens/signup_screen.dart';
import '../widgets/mycontainer.dart';
import 'package:flutter/services.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    this._curve =
        CurvedAnimation(parent: this._controller, curve: Curves.easeIn);
    this._sizeAnimation =
        Tween<double>(begin: 200, end: 400).animate(this._curve);
    this._colorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.white)
            .animate(this._curve);
    this._controller.addListener(() {
      setState(() {});
    });
    startAnimation();
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  TickerFuture startAnimation() {
    return this._controller.isCompleted ? null : _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    startAnimation();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "My Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontFamily: "Oswald",
                    fontSize: 40,
                  ),
                ),
                Image.asset(
                  "images/photo.png",
                  height: this._sizeAnimation.value,
                  width: this._sizeAnimation.value,
                ),
                MyContainer(
                  closedColor: Colors.deepPurple[100],
                  closedWidget: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: "Oswald",
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: 20, right: 50, left: 50, bottom: 30),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  openedWidget: LogInScreen(),
                ),
                MyContainer(
                  closedColor: Colors.deepPurple[100],
                  openedWidget: SignUpScreen(),
                  closedWidget: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: "Oswald",
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(right: 50, left: 50, bottom: 30),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
