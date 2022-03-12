import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InputFormField extends StatefulWidget {
  final TextEditingController inputFormController;
  final String? Function(String?) validator;
  final TextInputType type;
  final String hintText;

  final IconData icon;

  const InputFormField(
      {Key? key,
      required this.inputFormController,
      required this.validator,
      required this.type,
        required this.icon,
      required this.hintText})
      : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: widget.inputFormController,
                  onChanged: (text) {
                    state.reset();
                    state.setValue(text);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      focusColor: primaryColor,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(widget.icon,
                          color: primaryColor, size: 20),
                      contentPadding: EdgeInsets.all(13)),
                ),
              ),
              const SizedBox(height: 5),
              Visibility(
                  visible: state.hasError,
                  child: Container(
                      height: 20,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                          widget.validator(widget.inputFormController.text)??"",
                          style: TextStyle(color: Colors.red))))
            ],
          );
        },
        validator: widget.validator);
  }
}
