import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
            'Login Screen'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defultFormField(
                    controller: emailController,
                    label: 'Email',
                    type: TextInputType.emailAddress,
                    prefix: Icons.email,
                    validate: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'password mut not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defultFormField(
                    controller: passwordController,
                    label: 'Password',
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility_off : Icons.visibility,
                    isPassword: isPassword,
                    suffixPressed: ()
                    {
                      setState((){
                        isPassword = !isPassword;
                      });
                    },
                    validate: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'password mut not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defultButton(
                      text: 'login',
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defultButton(
                      function: ()
                      {
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      text: 'ReGiSer',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Don\'t have an account?'
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            'Register Now'
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
