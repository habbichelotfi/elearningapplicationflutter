import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:elearningapp/screens/home/home_screen.dart';
import 'package:elearningapp/screens/register/register_screen.dart';
import 'package:elearningapp/screens/register/select_topics_screen.dart';
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) => SelectTopicsScreen()));
                  }
                },
                textButton: 'Sign in'),
            const SizedBox(height: 35),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const RegisterScreen()));
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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      var errorCode = e.code;
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
      showErrorDialog(errorMessage, context);
    }
  }
}
