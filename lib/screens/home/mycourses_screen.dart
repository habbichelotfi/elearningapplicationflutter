import 'package:elearningapp/widgets/default_button.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  _MyCoursesScreenState createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You don't have any courses right now",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          const SizedBox(height: 10,),
          DefaultButton(
              onPressed: () {},
              textButton: 'Go explore all the courses',
              percentage: 0.7,
              isLoading: false)
        ],
      ),
      ));
  }
}
