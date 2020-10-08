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
  final List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Size getSize(key) {
    final RenderBox renderBoxTab = key.currentContext.findRenderObject();
    final tabSize = renderBoxTab.size;
    return tabSize;
  }

  Offset getPosition(key) {
    final RenderBox renderBoxTab = key.currentContext.findRenderObject();
    final tabPosition = renderBoxTab.localToGlobal(Offset.zero);
    return tabPosition;
  }

  void tapHandler(index, key) {
    setState(() {
      _currentIndex = index;
    });
    Future.delayed(Duration(milliseconds: 20),() {
      setState(() {
        _indicatorWidth = getSize(key).width + 16;
        _indicatorHeight = getSize(key).height + 22;
        _indicatorPosition = getPosition(key).dx - 8;
      });
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
      child: Stack(fit: StackFit.expand, children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutCirc,
          left: _indicatorPosition,
          top: 8,
          child: SizedBox(
            height: _indicatorHeight,
            width: _indicatorWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(4)),
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
              wrapKey: keys[0],
            ),
            BottomNavBarItem(
              icon: Icons.add,
              text: "",
              index: 1,
              showCondition: checkIndex,
              tapHandler: tapHandler,
              wrapKey: keys[1]
            ),
            BottomNavBarItem(
              icon: Icons.explore,
              text: "Explore",
              index: 2,
              showCondition: checkIndex,
              tapHandler: tapHandler,
              wrapKey: keys[2],
            ),
          ],
        ),
      ]),
    );
  }
}
