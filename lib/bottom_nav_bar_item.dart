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
    return Container(
      child: showCondition(index)
          ? Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(icon),
          Text(text),
        ],
      )
          : GestureDetector(
        onTap: () => tapHandler(index),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
