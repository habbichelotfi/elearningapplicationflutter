import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/screens/login/login_screen.dart';
import 'package:elearningapp/screens/register/select_topics_screen.dart';
import 'package:elearningapp/utilities/utilitis.dart';
import 'package:elearningapp/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'default_button.dart';
import 'form_field.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

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
                inputFormController: _fullnameController,
                validator: emailValidator,
                type: TextInputType.name,
                icon: Icons.person,
                hintText: "Full name"),
            const SizedBox(height: 10),
            InputFormField(
                inputFormController: _emailController,
                validator: emailValidator,
                type: TextInputType.emailAddress,
                hintText: 'Email Address',
                icon: Icons.email_outlined),
            const SizedBox(height: 10),
            PasswordFormField(
                validator: passwordValidator,
                passwordController: _passwordController),
            const SizedBox(height: 25),
            DefaultButton(
                isLoading: _isLoading,
                percentage: 1,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _register();
                    if (_success)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => SelectTopicsScreen()));
                  }
                },
                textButton: 'Sign Up'),
            const SizedBox(height: 35),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => LoginScreen()));
                },
                child: Text("I already have an account",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
            )
          ],
        ));
  }

  void _register() async {
    final user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }
}
