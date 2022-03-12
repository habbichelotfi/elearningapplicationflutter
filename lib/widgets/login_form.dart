import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:elearningapp/screens/home/home_screen.dart';
import 'package:elearningapp/screens/register/register_screen.dart';
import 'package:elearningapp/size_config.dart';
import 'package:elearningapp/utilities/utilitis.dart';
import 'package:elearningapp/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'default_button.dart';
import 'form_field.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _success = false;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            InputFormField(
              inputFormController: _emailController,
              validator: emailValidator,
              type: TextInputType.emailAddress,
              hintText: "Your email address",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 20),
            PasswordFormField(
                validator: passwordValidator,
                passwordController: _passwordController),
            const SizedBox(height: 8),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ForgotPasswordScreen()));
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text('Forgot your password?',
                        style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline)))),
            const SizedBox(height: 25),
            DefaultButton(
                isLoading: _isLoading,
                percentage: 1,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    await _login();
                  }
                },
                textButton: 'Sign in'),
            const SizedBox(height: 35),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => RegisterScreen()));
                },
                child: Text("You don't have an account",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
            )
          ],
        ));
  }

  Future _login() async {
    // await _auth
    //     .signInWithEmailAndPassword(
    //       email: _emailController.text,
    //       password: _passwordController.text,
    //     )
    //     .then((value) => {
    //           setState(() {
    //             _isLoading = false;
    //           }),
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (builder) => HomeScreen()))
    //         })
    //     .onError((error, stackTrace) => {
    //           setState(() {
    //             _isLoading = false;
    //           }),
    //           showDialog(
    //               context: context,
    //               builder: (BuildContext context) {
    //                 return AlertDialog(
    //                   content: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Text('Error'),
    //                       Text(error.toString()),
    //                       ElevatedButton(
    //                           onPressed: () {
    //                             Navigator.pop(context);
    //                           },
    //                           child: Text('Retry'))
    //                     ],
    //                   ),
    //                 );
    //               })
    //         });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "lotfihabbiche@gmail.com", password: "SuperSecretPassword!");
      setState(() {
        _isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      var errorCode = e.code;
      print(errorCode);
      var errorMessage = '';
      switch (errorCode) {
        case 'invalid-email':
          errorMessage = 'Mail Invalid';
          break;
        case 'user-not-found':
          errorMessage = 'Address mail not found';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong Password';
          break;
        default:
          {
            errorMessage = 'Internal error';
          }
      }

      setState(() {
        _isLoading = false;
      });
      showErrorDialog(errorMessage);
    }
    // if (user != null) {
    //   print('da');
    //   setState(() {
    //     _success = true;
    //   });
    // } else {
    //   setState(() {
    //     _success = false;
    //   });
    // }
  }

  showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: SizeConfig.screenWidth,
                  color: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                Text('Error',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                Text(errorMessage),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Retry'))
              ],
            ),
          );
        });
  }
}
