import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final bool isSelected;

  const RadioButton({Key? key, required this.isSelected}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.isSelected?primaryColor:Colors.transparent,
        border: Border.all(width: 2,color: widget.isSelected?primaryColor:Colors.grey.shade400)
      ),
      child:Visibility(
          visible: widget.isSelected,
          child: Icon(Icons.done,color: Colors.white,)),
    );
  }
}
