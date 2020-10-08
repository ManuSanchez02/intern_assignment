import 'package:flutter/material.dart';
import 'package:intern_assignment/bottom_nav_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  final changeScreen;

  BottomNavBar({this.changeScreen}) : super();

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  double _indicatorHeight;
  double _indicatorWidth;
  double _indicatorPosition;
  List<GlobalKey> tabKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Size getSizes() {
    print(tabKeys[_currentIndex].currentContext);
    final RenderBox renderBoxTab =
    tabKeys[_currentIndex].currentContext.findRenderObject();
    final tabSize = renderBoxTab.size;
    return tabSize;
  }

  Offset getPosition() {
    final RenderBox renderBoxTab =
    tabKeys[_currentIndex].currentContext.findRenderObject();
    final tabPosition = renderBoxTab.localToGlobal(Offset.zero);
    return tabPosition;
  }

  void tapHandler(index)  {
    setState(() {
      _currentIndex = index;
    });
    widget.changeScreen(index);
    setState(() {
      _indicatorWidth = getSizes().width;
      _indicatorHeight = getSizes().height + 13;
      _indicatorPosition = getSizes().width * index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: kBottomNavigationBarHeight,
      alignment: Alignment.center,
      child: Stack(
        children: [
          AnimatedPositioned(
              top: 10,
              left: _indicatorPosition,
              duration: Duration(seconds: 1),
              child: SizedBox(
                height: _indicatorHeight,
                width: _indicatorWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomNavBarItem(Icons.home, "Home", 1, 0),
                BottomNavBarItem(Icons.store, "Store", 1, 1),
                BottomNavBarItem(Icons.add, "", 1, 2),
                BottomNavBarItem(Icons.explore, "Explore", 1, 3),
                BottomNavBarItem(Icons.person, "Profile", 1, 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BottomNavBarItem(icon, text, flexSize, index) {
    return Expanded(
      flex: _currentIndex == index ? 2 : 1,
      child: _currentIndex == index
          ? Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          key: tabKeys[index],
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      )
          : GestureDetector(
        onTap: () => tapHandler(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

