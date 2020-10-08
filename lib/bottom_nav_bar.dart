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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          updateIndicator(
              getSize(keys[_currentIndex]), getPosition(keys[_currentIndex]))
        });
  }

  void updateIndicator(size, pos) {
    setState(() {
      _indicatorWidth = size.width + 16;
      _indicatorHeight = size.height + 22;
      _indicatorPosition = pos.dx - 8;
    });
  }

  void tapHandler(index, key) {
    setState(() {
      _currentIndex = index;
    });
    /*Future.delayed(Duration(milliseconds: 20), () {
      setState(() {
        _indicatorWidth = getSize(key).width + 16;
        _indicatorHeight = getSize(key).height + 22;
        _indicatorPosition = getPosition(key).dx - 8;
      });
    });*/
    widget.changeScreen(index);
  }

  bool checkIndex(index) {
    return _currentIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _indicatorPosition = getPosition(keys[_currentIndex]).dx - 8,
          _indicatorWidth = getSize(keys[_currentIndex]).width + 16,
          _indicatorHeight = getSize(keys[_currentIndex]).height + 22,
        });

    return Container(
      height: kBottomNavigationBarHeight,
      alignment: Alignment.center,
      child: Stack(fit: StackFit.expand, children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
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
              indicatorUpdater: updateIndicator,
            ),
            BottomNavBarItem(
              icon: Icons.store,
              text: "Store",
              index: 1,
              showCondition: checkIndex,
              tapHandler: tapHandler,
              wrapKey: keys[1],
              indicatorUpdater: updateIndicator,
            ),
            BottomNavBarItem(
              icon: Icons.add,
              text: "",
              index: 2,
              showCondition: checkIndex,
              tapHandler: tapHandler,
              wrapKey: keys[2],
              indicatorUpdater: updateIndicator,
            ),
            BottomNavBarItem(
              icon: Icons.explore,
              text: "Explore",
              index: 3,
              showCondition: checkIndex,
              tapHandler: tapHandler,
              wrapKey: keys[3],
              indicatorUpdater: updateIndicator,
            ),
            BottomNavBarItem(
              icon: Icons.person,
              text: "Profile",
              index: 4,
              showCondition: checkIndex,
              tapHandler: tapHandler,
              wrapKey: keys[4],
              indicatorUpdater: updateIndicator,
            ),
          ],
        ),
      ]),
    );
  }
}
