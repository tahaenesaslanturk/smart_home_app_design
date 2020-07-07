import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class MyContainer extends StatelessWidget {
  Widget closedWidget;
  Widget openedWidget;
  Color closedColor;

  MyContainer({this.closedWidget, this.openedWidget, this.closedColor});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: closedColor,
      closedElevation: 0,
      closedBuilder: (context, action) => closedWidget,
      openBuilder: (context, action) => openedWidget,
    );
  }
}
