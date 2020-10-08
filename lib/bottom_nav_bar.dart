import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intern_assignment/bottom_nav_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  final changeScreen;

  BottomNavBar({this.changeScreen});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  double _indicatorHeight;
  double _indicatorWidth;
  double _indicatorPosition;

  Size getSize(key){
    final RenderBox renderBoxTab =
    key.currentContext.findRenderObject();
    final tabSize = renderBoxTab.size;
    return tabSize;
  }

  void tapHandler(index, key) async {
    await setState(() {
      _currentIndex = index;
    });
    setState(() {
     // _indicatorWidth = getSize(key).width;
      print(_indicatorWidth);
    });

    widget.changeScreen(index);
  }

  bool checkIndex(index) {
    return _currentIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      alignment: Alignment.center,
      child: Stack(children: [
        SizedBox(
          height: 10,
          width: _indicatorWidth,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavBarItem(
              icon: Icons.home,
              text: "Home",
              index: 0,
              showCondition: checkIndex,
              tapHandler: tapHandler,
            ),
            BottomNavBarItem(
              icon: Icons.add,
              text: "",
              index: 1,
              showCondition: checkIndex,
              tapHandler: tapHandler,
            ),
            BottomNavBarItem(
              icon: Icons.explore,
              text: "Explore",
              index: 2,
              showCondition: checkIndex,
              tapHandler: tapHandler,
            ),
          ],
        ),
      ]),
    );
  }
}
