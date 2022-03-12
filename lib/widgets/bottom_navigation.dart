import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconList;
  final List<String> listNavigation;

  const CustomBottomNavigationBar({
    Key? key,
    this.defaultSelectedIndex = 0,
    required this.iconList,
    required this.onChange,
    required this.listNavigation,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<String> _iconList = [];
  List<String> _listNavigation = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _listNavigation = widget.listNavigation;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i, _listNavigation[i]));
    }

    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _navBarItemList,
        ));
  }

  Widget buildNavBarItem(String iconPath, int index, String titleNavigation) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        //margin: const EdgeInsets.only(left: 10, right: 10),
        height: 75,
        width: getProportionateScreenWidth(70),
        decoration: index == _selectedIndex
            ? const BoxDecoration(color: Colors.white)
            : const BoxDecoration(color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(iconPath,
              width: 25,
              height: 25,
              color: index == _selectedIndex
                  ? primaryColor
                  : Colors.grey.shade400),
          const SizedBox(height: 10),
          Text(titleNavigation,
              style: TextStyle(
                  color: index == _selectedIndex
                      ? primaryColor
                      : Colors.grey.shade400,
                  fontSize: 13))
        ]),
      ),
    );
  }
}
