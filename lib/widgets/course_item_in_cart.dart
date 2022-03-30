import 'package:elearningapp/widgets/rectangular_radio_button.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatefulWidget {
  final String titleCourse;
  final String courseOwner;
  final int price;

  const CourseItem(
      {Key? key,
      required this.courseOwner,
      required this.price,
      required this.titleCourse})
      : super(key: key);

  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          RadioButton(isSelected: false),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    color: Colors.grey,
                  )
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
