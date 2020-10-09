import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  final showCondition;
  final tapHandler;
  final GlobalKey wrapKey;
  final indicatorUpdater;

  BottomNavBarItem(
      {this.icon,
      this.text,
      this.index,
      this.showCondition,
      this.tapHandler,
      this.wrapKey,
      this.indicatorUpdater});

  @override
  Widget build(BuildContext context) {
    //print('rebuilt $wrapKey');

    Offset indicatorPosition;
    Size indicatorSize;

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

    if (showCondition(index)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => {
            indicatorPosition = getPosition(wrapKey),
            indicatorSize = getSize(wrapKey),
            indicatorUpdater(indicatorSize, indicatorPosition)
          });
    }

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
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ]
            : [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 20,
                )
              ],
      ),
    ));
  }
}
