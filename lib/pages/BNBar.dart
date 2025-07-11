import 'package:flutter/material.dart';
import 'package:gluvi/pages/HomePage.dart';
import 'package:gluvi/pages/DiaryPage.dart';
import 'package:gluvi/pages/CulculationPage.dart';
import 'package:gluvi/pages/NotificationPage.dart';
import 'package:gluvi/pages/ProfilePage.dart';

class BNBar extends StatefulWidget{
  _BNBarState createState() => _BNBarState();
}

class _BNBarState extends State<BNBar>{
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    DiaryPage(),
    CulculationPage(),
    NotificationPage(),
    ProfilePage(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
BottomNavigationBarItem(label: '', icon: Image.asset( _selectedIndex == 0 ? 'assets/home_active.png' : 'assets/home.png', width: 64, height: 64)),
BottomNavigationBarItem(label: '', icon: Image.asset( _selectedIndex == 1 ? 'assets/diary_active.png' : 'assets/diary.png', width: 64, height: 64)),
BottomNavigationBarItem(label: '', icon: Image.asset( _selectedIndex == 2 ? 'assets/culculation_active.png' : 'assets/culculate.png', width: 64, height: 64)),
BottomNavigationBarItem(label: '', icon: Image.asset( _selectedIndex == 3 ? 'assets/notification_active.png' : 'assets/notification.png', width: 64, height: 64)),
BottomNavigationBarItem(label: '', icon: Image.asset( _selectedIndex == 4 ? 'assets/profile_active.png' : 'assets/profile.png', width: 64, height: 64)),
      ],
        currentIndex: _selectedIndex,
        onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}