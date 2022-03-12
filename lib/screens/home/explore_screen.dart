import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/widgets/course_card.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<CourseCard> popularCourses = [
    CourseCard(
        courseName: "Design Thinking Fundamental",
        courseOwner: "Robert Fox",
        coursePrice: "\$ 150",
        courseRating: "4.8",
        isLiked: true),
    CourseCard(
        courseName: "Design Thinking Fundamental",
        courseOwner: "Robert Fox",
        coursePrice: "\$ 150",
        courseRating: "4.8",
        isLiked: true),
    CourseCard(
        courseName: "Design Thinking Fundamental",
        courseOwner: "Robert Fox",
        coursePrice: "\$ 150",
        courseRating: "4.8",
        isLiked: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: getProportionateScreenHeight(165),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Color(0xff00a9b8),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi,Bro",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let's start learning",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkPrimaryColor,
                        ),
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/home_icons/cart.png',
                          width: 10,
                          height: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkPrimaryColor,
                        ),
                        width: 40,
                        height: 40,
                        child:
                        Image.asset('assets/home_icons/notification.png'),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  height: 52,
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      prefixIcon: Container(
                          padding: EdgeInsets.all(16),
                          child: Image.asset('assets/home_icons/search.png')),
                      focusColor: Colors.grey,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Search for anything',
                    ),
                  ))
            ])),
        const SizedBox(height: 30),
        Column(
          children: [
            SizedBox(
                width: SizeConfig.screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular course",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                )),
            const SizedBox(height: 20),
            Container(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    for (int i = 0; i < popularCourses.length; i++)
                      popularCourses[i]
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: SizeConfig.screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
