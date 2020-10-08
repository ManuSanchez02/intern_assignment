import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  final showCondition;
  final tapHandler;
  final GlobalKey wrapKey;

  BottomNavBarItem(
      {this.icon, this.text, this.index, this.showCondition, this.tapHandler, this.wrapKey});

  @override
  Widget build(BuildContext context) {
    print('rebuilt $wrapKey');
    return Container(
        child: GestureDetector(
      onTap: () => tapHandler(index, wrapKey),
      child: Wrap(
        key: wrapKey,
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
