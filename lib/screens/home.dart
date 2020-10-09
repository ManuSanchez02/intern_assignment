import 'package:flutter/material.dart';
import 'package:intern_assignment/bottom_nav_bar.dart';
import 'package:intern_assignment/screens/color_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ColorScreen> screens = [
    ColorScreen(Colors.amber),
    ColorScreen(Colors.blue),
    ColorScreen(Colors.green),
    ColorScreen(Colors.redAccent),
    ColorScreen(Colors.blue[900]),
  ];
  int _currentScreen = 0;

  void changeScreenHandler(index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentScreen],
      bottomNavigationBar: BottomNavBar(changeScreen: changeScreenHandler),
    );
  }
}
