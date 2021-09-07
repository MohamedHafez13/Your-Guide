import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({
  required String pageTitle,
  Color? backGroundColor = Colors.white,
  IconData? firstIcon ,
  IconData? secondIcon,
  IconData? thirdIcon,
  VoidCallback? firstIconNavigator,
  VoidCallback? secondIconNavigator,
  VoidCallback? thirdIconNavigator,
}) {
  return AppBar(
    title: Text(
      pageTitle,
      style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    leading:
      IconButton(
        color: Colors.black,
        icon: Icon(firstIcon),
        onPressed: firstIconNavigator,
      ),

    backgroundColor: backGroundColor,
    actions: [
      IconButton(
        icon: Icon(secondIcon),
        onPressed: secondIconNavigator,
        color: Colors.black,
      ),
      IconButton(
        icon: Icon(thirdIcon),
        onPressed: thirdIconNavigator,
        color: Colors.black,
      ),
    ],
  );
}
