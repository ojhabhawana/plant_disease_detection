import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/screens/myprofile.dart';
import 'package:cropssafe/screens/classifieddisease.dart';
import 'package:cropssafe/weatherscreen/weather.dart';
import 'package:flutter/material.dart';

import '../screens/homepage.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  var _selectedIndex = 0;
  final List _pages = [
    Home_page(),
    wether(),
    Myprofile(),
  ];

  void _selectedpages(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMain,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kMain,
          selectedItemColor: Colors.white,
          unselectedItemColor: kFoamColor.withValues(alpha: .8),
          type: BottomNavigationBarType.fixed,
          //showSelectedLabels: false,
          //showUnselectedLabels: false,
          onTap: _selectedpages,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1 ? Icons.category : Icons.cloud),
                label: 'Weather'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 3 ? Icons.person : Icons.person),
                label: 'Profile')
          ]),
    );
  }
}
