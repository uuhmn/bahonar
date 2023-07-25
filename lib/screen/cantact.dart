import 'package:bahonar_shiraz1400/screen/movies.dart';
import 'package:bahonar_shiraz1400/screen/passscreen.dart';
import 'package:flutter/material.dart';

class Contactscreen extends StatefulWidget {
  const Contactscreen({Key? key}) : super(key: key);

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    // TODO: Add your pages here
    PasswordScreen(),
    MoviesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'صفحه اصلی',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'درباره ما',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'محصولات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'تماس با ما',
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}