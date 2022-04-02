import 'package:elearningapp/size_config.dart';
import 'package:elearningapp/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text('Login account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Login to your account to start your course lessons',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.facebook_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
            const SizedBox(height: 30),
            Center(
                child: const Text('or sign in with your email',
                    style: TextStyle(color: Colors.grey))),
            const SizedBox(
              height: 30,
            ),
            const LoginForm()

          ],
        ),
      ))),
    );
  }
}
