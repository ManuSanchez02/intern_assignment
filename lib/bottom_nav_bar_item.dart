import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {

  final IconData icon;
  final String text;
  final int index;
  final showCondition;
  final tapHandler;


  BottomNavBarItem({this.icon, this.text, this.index, this.showCondition, this.tapHandler});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    

    return Container(
      child: showCondition(index)
          ? Wrap(
        key: key,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(icon),
          Text(text),
        ],
      )
          : GestureDetector(
        onTap: () => tapHandler(index, key),
        child: Wrap(
          key: key,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
