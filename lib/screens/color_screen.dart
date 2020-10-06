import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  final Color color;

  ColorScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
