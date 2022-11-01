import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components2.dart';

class LoginScreen2 extends StatefulWidget {

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defultFormField2(
                    label: 'Email Address',
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    prefix: Icons.email,
                    validate: (value)
                    {
                      if(value!.isEmpty){
                        return 'Email Address is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defultFormField2(
                    label: 'Password',
                    controller: passwordController,
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
                      if(value!.isEmpty){
                        return 'password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defultButton2(
                    text: 'Login',
                    raduis: 10.0,
                    background: Colors.pink,
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
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              color: Colors.pink,
                            ),
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
