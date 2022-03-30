import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final Function() onPressed;
  final String textButton;
  final double percentage;
  final bool isLoading;

  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.textButton,
      required this.percentage,
      required this.isLoading})
      : super(key: key);

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: widget.isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text(widget.textButton,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        elevation: 0,
          fixedSize: Size(SizeConfig.screenWidth * widget.percentage, 52),
          primary: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
    );
  }
}
