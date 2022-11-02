import 'package:flutter/material.dart';

Widget defultFormField2({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  bool isPassword = false,
  required var validate,
  required IconData prefix,
  IconData? suffix,
  var suffixPressed,
  var onChange,
  var onSubmit,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  validator: validate,
  onChanged: onChange,
  onFieldSubmitted: onSubmit,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix,),
    suffixIcon: IconButton(
      onPressed: suffixPressed,
      icon: Icon(suffix,),
    ),
    border: OutlineInputBorder(),
  ),
);

Widget defultButton2({
  double width = double.infinity,
  Color background = Colors.blue,
  double raduis = 3.0,
  required var function,
  required String text,
  bool isUpperCase = true,
}) => Container(
  width: width,
  height: 40.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(raduis),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);