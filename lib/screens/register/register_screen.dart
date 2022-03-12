import 'package:elearningapp/widgets/register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
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
            Text('Create account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
            const SizedBox(height: 30),
            Text('Create your account to start your course lessons',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.facebook_outlined,
                      color: Colors.blue, size: 30),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      Container(
                          padding: EdgeInsets.all(10),

                          child: Image.asset('assets/images/google.png')),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/images/apple.png',
                        width: 20,
                        height: 20,
                      )),
                )
              ],
            ),
            const SizedBox(height: 30),
            const Center(
                child: Text('Or sign up with your email',
                    style: TextStyle(color: Colors.grey))),
            const SizedBox(height: 30),
            const RegisterForm()
          ],
        ),
      ))),
    );
  }
}
