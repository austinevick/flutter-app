import 'package:covid_19_application/UI/homepage.dart';
import 'package:covid_19_application/UI/statistic_screen.dart';
import 'package:covid_19_application/constant/palette.dart';
import 'package:covid_19_application/webservice/webservice.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screens = [HomePage(), StatisticScreen()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Palette.primaryColor,
          iconSize: 32,
          currentIndex: _currentIndex,
          onTap: (value) => setState(() => _currentIndex = value),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart), title: Text('')),
          ],
        ));
  }
}
