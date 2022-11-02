import 'package:flutter/material.dart';
// Reusable Components:
// 1. timing
// 2. refactor
// 3. quality
// 4. clean code

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  @required var function,
  required String text,
}) => Container(
  width: width,
  height: 40.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
        radius,
    ),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  var onTap,
  bool isPassword = false,
  required var validate,
  required String label,
  required IconData prefix,
  IconData? suffix = null,
  var suffixPressed,
  bool isClickable = true,
}) => TextFormField(
controller: controller,
keyboardType: type,
obscureText: isPassword,
enabled: isClickable,
onFieldSubmitted: onSubmit,
onChanged: onChange,
onTap: onTap,
validator: validate,
decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(prefix,),
suffixIcon: IconButton(
    onPressed: suffixPressed,
    icon: Icon(suffix,)),
border: OutlineInputBorder(),
),
);
