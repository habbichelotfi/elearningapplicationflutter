import 'package:elearningapp/screens/home/explore_screen.dart';
import 'package:elearningapp/screens/home/mycourses_screen.dart';
import 'package:elearningapp/screens/home/profile_screen.dart';
import 'package:elearningapp/screens/home/wishlist_screen.dart';
import 'package:elearningapp/size_config.dart';
import 'package:elearningapp/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:elearningapp/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

var fullName = '';

Future getFullName() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('full_name')) fullName = prefs.getString('full_name')!;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getFullName().then((value) => {setState(() {})});
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    MyCoursesScreen(),
    WishListScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: primaryColor,
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomBottomNavigationBar(
        listNavigation: ['Explore', 'My course', 'Wishlist', 'Profile'],
        iconList: [
          'assets/home_icons/discovery.png',
          'assets/home_icons/play.png',
          'assets/home_icons/heart.png',
          'assets/home_icons/user.png'
        ],
        onChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        defaultSelectedIndex: _selectedIndex,
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
