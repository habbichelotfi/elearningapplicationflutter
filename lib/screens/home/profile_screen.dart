import 'package:elearningapp/constants/colors.dart';
import 'package:elearningapp/screens/profile/personnal_info_screen.dart';
import 'package:elearningapp/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text('Settings',
                      style:
                          TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  Text('Account', style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Emma Philips',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Personal Info', style: TextStyle(fontSize: 15)),
                        ],
                      )),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>PersonnalInfoScreen()));
                        },
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.arrow_forward_ios, size: 15)))
                    ],
                  ),
                  const SizedBox(height: 45),
                  Text('Settings', style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.orange.shade100,
                          child: const Icon(Icons.language_outlined,
                              color: Colors.orange, size: 28)),
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text('Language',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const Text('English', style: TextStyle(fontSize: 15)),
                      const SizedBox(width: 10),
                      InkWell(
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.arrow_forward_ios, size: 15)))
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(Icons.notifications_rounded,
                              color: primaryColor, size: 28)),
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text('Notifications',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const SizedBox(width: 10),
                      InkWell(
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.arrow_forward_ios, size: 15)))
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.deepPurple.shade100,
                          child: const Icon(Icons.shield_moon_outlined,
                              color: Colors.deepPurple, size: 28)),
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text('Dark Mode',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const Text('Off', style: TextStyle(fontSize: 15)),
                      const SizedBox(width: 10),
                      InkWell(
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.arrow_forward_ios, size: 15)))
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red.shade100,
                          child: const Icon(Icons.info_outline_rounded,
                              color: Colors.red, size: 28)),
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text('Log out',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const SizedBox(width: 10),
                      InkWell(
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.arrow_forward_ios, size: 15)))
                    ],
                  ),
                ],
              ),
            )));
  }
}
