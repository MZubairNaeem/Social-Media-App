import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sayhi/views/home/navigation_pages/moments_page.dart';
import 'package:sayhi/views/home/navigation_pages/post_page.dart';
import 'package:sayhi/views/home/navigation_pages/profile_page.dart';
import 'package:sayhi/views/home/navigation_pages/search_user_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PostPage(),
    MomentsPage(),
    SearchUser(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Say Hi'),
          backgroundColor: Colors.deepPurple
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                //active icon
                label: 'Home',
                backgroundColor: Colors.deepPurple
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: 'Moments',
                backgroundColor: Colors.deepPurple
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.deepPurple
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.deepPurple,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}