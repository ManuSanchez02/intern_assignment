import 'package:flutter/material.dart';
import 'package:intern_assignment/screens/color_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ColorScreen(Colors.indigo),
    ColorScreen(Colors.redAccent),
    ColorScreen(Colors.amber),
    ColorScreen(Colors.pinkAccent),
    ColorScreen(Colors.green),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.shifting,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              title: Text('Store'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ]),
    );
  }
}
