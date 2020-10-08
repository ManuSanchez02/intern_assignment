import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  final showCondition;
  final tapHandler;

  BottomNavBarItem(
      {this.icon, this.text, this.index, this.showCondition, this.tapHandler});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    print('rebuilt $index');

    return Container(
        child: GestureDetector(
      onTap: () => tapHandler(index, key),
      child: Wrap(
        key: key,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: showCondition(index)
            ? [
                Icon(
                  icon,
                  color: Colors.red,
                  size: 20,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.red, fontSize: 17),
                ),
              ]
            : [
                Icon(
                  icon,
                  color: Colors.red,
                  size: 20,
                )
              ],
      ),
    ));
  }
}
