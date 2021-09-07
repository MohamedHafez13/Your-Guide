import 'package:flutter/material.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
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
      prefixIcon: Icon(prefixIcon),
      suffixIcon: Icon(suffixIcon),
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
