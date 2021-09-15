import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle labelsStyle(){

  return TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}

TextStyle coloredWordsStyle(
{
  double size = 18,
}
    ){

  return TextStyle(
    color: Colors.red,
    fontSize: size,
  );
}