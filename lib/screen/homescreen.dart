import 'package:bahonar_shiraz1400/screen/cantact.dart';
import 'package:bahonar_shiraz1400/screen/movies.dart';
import 'package:flutter/material.dart';
import 'main_home.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var selefloat = 0;
  ScrollController? _controller;
  static List screenhome = [MainHome(),MoviesScreen(),Contactscreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'تصویر'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'فیلم'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'مخاطبین')
        ],
        onTap: _onItemTapped,
        currentIndex: selefloat,
      ),
      body: Center(
        child: screenhome.elementAt(selefloat),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selefloat = index;
    });
  }
}
