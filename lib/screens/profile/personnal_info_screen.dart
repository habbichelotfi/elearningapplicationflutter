import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class PersonnalInfoScreen extends StatefulWidget {
  const PersonnalInfoScreen({Key? key}) : super(key: key);

  @override
  _PersonnalInfoScreenState createState() => _PersonnalInfoScreenState();
}

class _PersonnalInfoScreenState extends State<PersonnalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Your account'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: SizeConfig.screenWidth * 0.85,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text('Account',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                'Photo',
                                style: TextStyle(color: Colors.grey.shade400),
                              ),
                              const SizedBox(width: 40),
                              Column(
                                children: [
                                  CircleAvatar(
                                      radius: 55,
                                      backgroundColor: Colors.grey.shade200),
                                  Text('Upload Image',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: primaryColor))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Text('Name',
                                  style:
                                      TextStyle(color: Colors.grey.shade400)),
                              const SizedBox(width: 40),
                              Flexible(
                                  child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              hintText: 'Name',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey.shade400),
                                              focusColor: Colors.black,
                                              fillColor: Colors.black))))
                              //TextFormField()
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Text('Gender',
                                  style:
                                      TextStyle(color: Colors.grey.shade400)),
                              const SizedBox(width: 40),
                              Container(
                                  width: 45,
                                  height: 45,
                                  child: Icon(Icons.female_outlined,
                                      color: Colors.white),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(24))),
                              const SizedBox(width: 10),
                              Container(
                                  width: 45,
                                  height: 45,
                                  child: Icon(Icons.male_outlined,
                                      color: Colors.grey),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(24)))
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Text('Age',
                                  style:
                                      TextStyle(color: Colors.grey.shade400)),
                              const SizedBox(width: 50),
                              Flexible(
                                  child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              hintText: 'Your age',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey.shade400),
                                              focusColor: Colors.black,
                                              fillColor: Colors.black,
                                              labelText: '20'))))
                              //TextFormField()
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Text('Email',
                                  style:
                                      TextStyle(color: Colors.grey.shade400)),
                              const SizedBox(width: 40),
                              Flexible(
                                  child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              hintText: 'email@gmail.com',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey.shade400),
                                              focusColor: Colors.black,
                                              fillColor: Colors.black,
                                              labelText: 'email@gmail.com'))))
                              //TextFormField()
                            ],
                          )
                        ])))));
  }
}
