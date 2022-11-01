import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/Login_Screen2.dart';
import 'package:udemy_flutter/layout/home_layout.dart';
import 'package:udemy_flutter/modules/bmi/BMI_Screen.dart';
import 'package:udemy_flutter/modules/counter/Counter_Screen.dart';
import 'package:udemy_flutter/modules/login/Login_Screen.dart';
import 'package:udemy_flutter/modules/messenger/Messenger_Screen2.dart';
import 'package:udemy_flutter/modules/users/Users_Screen.dart';
import 'package:udemy_flutter/test_Screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }

}
