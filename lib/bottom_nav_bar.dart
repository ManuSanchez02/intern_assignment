import 'package:flutter/material.dart';
import 'package:intern_assignment/bottom_nav_bar_item.dart';

class BottomNavBar extends StatefulWidget {

  final changeScreen;
  BottomNavBar({this.changeScreen});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void tapHandler(index){
    setState(() {
      _currentIndex = index;
    });
    widget.changeScreen(index);
  }

  bool checkIndex(index){
    return _currentIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavBarItem(icon: Icons.home, text: "Home", index: 0, showCondition: checkIndex, tapHandler: tapHandler,),
          BottomNavBarItem(icon: Icons.add, text: "", index: 1, showCondition: checkIndex, tapHandler: tapHandler,),
          BottomNavBarItem(icon: Icons.explore, text: "Explore", index: 2, showCondition: checkIndex, tapHandler: tapHandler,),
        ],
      ),
    );
  }
}
