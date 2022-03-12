import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String courseOwner;
  final String coursePrice;
  final String courseRating;
  final bool isLiked;

  const CourseCard(
      {Key? key,
      required this.courseName,
      required this.courseOwner,
      required this.coursePrice,
      required this.courseRating,
      required this.isLiked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 270,
      width: 215,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(courseRating),
                    )),
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          ),
           const SizedBox(height: 10),
           Text(courseName,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.person,color: Colors.grey.shade400),
              Text(courseOwner,style: TextStyle(color: Colors.grey.shade400,fontSize: 13),)
            ],
          ),
          const SizedBox(height: 5,),
          Text(coursePrice,style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold),)

        ],
      ),
    );
  }
}
