import 'package:flutter/material.dart';
import 'package:fit_palette2/Page/Home/MyWeight.dart';
import 'package:fit_palette2/Page/Home/Home.dart';
import 'package:fit_palette2/Page/Home/Profile.dart';
import 'package:fit_palette2/Page/Home/Routine.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var _currentIndex = 3;
  final List<Widget> _pages = [
    MyWeight(),
    Profile(),
    Routine(),
    Home(),
  ];

  final List<String> _titles = [
    'MyWeight',
    'Profile',
    'Routine',
    'Home',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'MyWeight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Routine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
