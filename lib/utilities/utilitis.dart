import 'package:flutter/material.dart';

import '../size_config.dart';
String? emailValidator(String? text){
  if(text==null || text.isEmpty){
    return "Champ obligatoire";
  }
  return null;
}
String? passwordValidator(String? text){
  if(text==null || text.isEmpty){
    return "Champ obligatoire";
  }
  return null;
}
showErrorDialog(String errorMessage,BuildContext context) {
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
                child:const Icon(Icons.close, color: Colors.white),
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