import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/widgets/course_card.dart';
import 'package:elearningapp/widgets/course_item_in_cart.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  var f = [];
  Future getAllCourses() async {
    //var courses = await FirebaseFirestore.instance.collection('courses').get();
    FirebaseFirestore.instance
        .collection('courses')
        .get()
        .then((value) => value.docs.forEach((element) {}));

    //courses.first.then((value) => print(value.docs.first.data()));
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> courses =
      FirebaseFirestore.instance.collection('courses').snapshots();
  final List<String> _listTopics = [
    'Web dev',
    'Mobile Dev',
    'IA',
    'Blockchain',
    'Security',
    'Network',
    'Gaming',
    'Data science',
    'Algorithms'
  ];
  final List<String> _listIconsTopics = [
    'assets/images/web.png',
    'assets/images/mobile.png',
    'assets/images/ia.png',
    'assets/images/blockchain.png',
    'assets/images/security.png',
    'assets/images/network.png',
    'assets/images/gaming.png',
    'assets/images/data_science.png',
    'assets/images/algorithm.png',
  ];
  List<CourseCard> popularCourses = const [
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
  void initState() {
    super.initState();
    getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
            height: getProportionateScreenHeight(165),
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
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
                            fontSize: 23,
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let's start learning",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'OpenSans',
                            color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            showCustomModalBottomSheet(
                              expand: false,
                              context: context,
                              builder: (context) => Container(),
                              containerWidget: (BuildContext context,
                                  Animation<double> animation, Widget child) {
                                return Scaffold(
                                    backgroundColor: Colors.transparent,
                                    body: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Align(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17)),
                                                child:
                                                    Icon(Icons.close_outlined),
                                              ),
                                              alignment: Alignment.topRight,
                                            )),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: SizeConfig.screenWidth,
                                          padding: EdgeInsets.all(22),
                                          height: SizeConfig.screenHeight * 0.7,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30))),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Your items',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              CourseItem(
                                                  courseOwner: 'courseOwner',
                                                  price: 79,
                                                  titleCourse: 'titleCourse')
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        )
                                      ],
                                    ));
                              },
                            );
                          },
                          child: Container(
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
                          )),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Categories",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          for (int i = 0; i < _listTopics.length; i++)
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      _listIconsTopics.elementAt(i),
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      _listTopics.elementAt(i),
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ]),
                            )
                        ],
                      )
                    ])),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        // FutureBuilder<DocumentSnapshot>(
        //   future: courses.doc('IA').get(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text("Something went wrong");
        //     }
        //
        //     if (snapshot.hasData && !snapshot.data!.exists) {
        //       return Text("Document does not exist");
        //     }
        //
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       Map<String, dynamic> data =
        //           snapshot.data!.data() as Map<String, dynamic>;
        //       return Text(
        //           "Full Name: ${data['full_name']} ${data['last_name']}");
        //     }
        //
        //     return Text("loading");
        //   },
        // )
        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('courses')
              .doc('IA')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            // print(snapshot.data!.docs.elementAt(0).get('machine_learning'));
            //for a specific field

            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return Column(children: [Text(snapshot.data!.id)]);
            //   ListView(
            //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //     Map<String, dynamic> data =
            //         document.data()! as Map<String, dynamic>;
            //     return ListTile(
            //       title: Text('data'),
            //       //subtitle: Text(data['company']),
            //     );
            //   }).toList(),
            // );
          },
        )
      ],
    ));
  }
}
