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

  Offset getPosition(key) {
    final RenderBox renderBoxTab =
    key.currentContext.findRenderObject();
    final tabPosition = renderBoxTab.localToGlobal(Offset.zero);
    return tabPosition;
  }


  void tapHandler(index, key) async {
    await setState(() {
      _currentIndex = index;
      _indicatorWidth = getSize(key).width;
      _indicatorHeight = getSize(key).height;
      _indicatorPosition = getPosition(key).dx;
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
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutCirc,
          left: _indicatorPosition,
          child: SizedBox(
            height: _indicatorHeight,
            width: _indicatorWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
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
