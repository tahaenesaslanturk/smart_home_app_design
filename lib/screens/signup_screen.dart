import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/screens/login_screen.dart';
import 'package:testing_app/widgets/mycontainer.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color bacgroundColor = Colors.lightBlue[200];
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: bacgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Oswald",
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 60, left: 60, bottom: 50),
                  child: Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                  child: MyTextField(
                      keyboardType: TextInputType.text,
                      labelText: "Name-Surname",
                      hintText: "Name-Surname",
                      pIcon: Icons.person_outline),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                  child: MyTextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    pIcon: Icons.phone,
                    labelText: "Phone number",
                    hintText: "+90 xxx xx xx",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                  child: MyTextField(
                    pIcon: Icons.mail_outline,
                    hintText: "Email",
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                  child: MyTextField(
                    suffixIcon: GestureDetector(
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: "Password",
                    hintText: "Password",
                    pIcon: Icons.lock_outline,
                  ),
                ),
                MyContainer(
                  openedWidget: LogInScreen(),
                  closedColor: bacgroundColor,
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
                    margin: EdgeInsets.only(
                        top: 20, right: 50, left: 50, bottom: 30),
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
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  TextInputType keyboardType;
  IconData pIcon;
  String hintText;
  bool obscureText;
  Widget suffixIcon;
  String labelText;

  MyTextField(
      {this.keyboardType,
      this.obscureText = false,
      this.hintText,
      this.pIcon,
      this.suffixIcon,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          pIcon,
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
