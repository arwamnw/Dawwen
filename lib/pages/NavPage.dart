import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dawwen02/pages/ClassifyPage.dart';
import 'package:dawwen02/pages/FavPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'ProfilePage.dart';
import 'setting.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int currentIndex = 1;
  //singout method
  void singoutuser() {
    FirebaseAuth.instance.signOut();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _tabItems = [ProfilePage(), Home(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _tabItems[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          onTap: onTabTapped,
          height: 55,
          animationDuration: Duration(milliseconds: 300),
          letIndexChange: (index) {
            return true;
          },
          color: Color.fromARGB(255, 152, 173, 196),
          backgroundColor: Colors.grey.shade100,
          buttonBackgroundColor: Color.fromARGB(255, 152, 173, 196),
          items: [
            Icon(Icons.person_2),
            Icon(Icons.home),
            Icon(Icons.settings),
          ]),
    );
  }
}
