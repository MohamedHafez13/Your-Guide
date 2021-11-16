import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 navigate(context , Widget page){
  return
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>page));
}

Widget defaultButton({
   double? width = double.infinity,
  required Color backGroundColor,
  required String label,
  required Color labelColor,
  required VoidCallback onPress,
}) {
  return Container(
    width: width,
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
        onPressed: () {},
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