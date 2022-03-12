import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/size_config.dart';
import 'package:elearningapp/utilities/utilitis.dart';
import 'package:elearningapp/widgets/default_button.dart';
import 'package:elearningapp/widgets/form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DefaultButton(
        isLoading: _isLoading,
        percentage: 0.86,
        onPressed: (){},
        textButton: 'Send',
      ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text('Reset your password'),
        ),
        body: Align(
            child: SizedBox(
          width: SizeConfig.screenWidth * 0.86,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Enter your email associated with your account and an email will be sent to you containing '
                  'instructions to reset your password',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(
                height: 30,
              ),
              InputFormField(
                  inputFormController: _emailController,
                  validator: emailValidator,
                  type: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  hintText: 'Email address')
            ],
          ),
        )));
  }
}
