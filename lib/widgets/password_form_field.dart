import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final String? Function(String?) validator;

  const PasswordFormField(
      {Key? key, required this.validator, required this.passwordController})
      : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isPasswordShown = true;

  istoggled() {
    setState(() {
      _isPasswordShown = !_isPasswordShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: widget.passwordController,
                obscureText: _isPasswordShown,
                onChanged: (text){
                  state.reset();
                  state.setValue(widget.passwordController.text);
                },
                decoration: InputDecoration(
                    hintText: "Your password",
                    border: InputBorder.none,
                    focusColor: primaryColor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor)),
                    prefixIcon:
                        Icon(Icons.lock_outline, color: primaryColor, size: 20),
                    contentPadding: EdgeInsets.all(13),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isPasswordShown
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye,
                          size: 20,
                          color: primaryColor),
                      onPressed: istoggled,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            Visibility(
                visible: state.hasError,
                child: Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                        widget.validator(widget.passwordController.text) ?? '',
                        style: TextStyle(color: Colors.red))))
          ],
        );
      },
      validator: widget.validator,
    );
  }
}
