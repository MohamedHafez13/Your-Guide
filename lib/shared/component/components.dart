import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixIconFunction,
  FormFieldValidator<String>? validation,
  GestureTapCallback? onTap,
  required TextInputType type,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: IconButton(
          icon: Icon(prefixIcon),
        onPressed: (){},
      ),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: suffixIconFunction,
      ),
    ),
    validator: validation,
    onTap: onTap,
    obscureText: isPassword,
  );
}


Widget defaultButton({
  required double width,
  required Color backGroundColor,
  required String label,
  required Color labelColor,
  required VoidCallback onPress,
}){
  return  Container(
    width: double.infinity,
    color: backGroundColor,
    child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: labelColor,
          ),
        ),
        onPressed: onPress),
  );
}
void showToast({
  required String text,
  required Color toastColor,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: toastColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
enum ToastColors {
  SUCCESS,
  ERROR,
  WARNING,
}

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.ERROR:
      c = Colors.red;
      break;
    case ToastColors.SUCCESS:
      c = Colors.green;
      break;
    case ToastColors.WARNING:
      c = Colors.amber;
      break;
  }

  return c;
}