import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sayhi/views/credentials/login.dart';
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

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
        },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed:  () {
        _signOut();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Sign out"),
      content: const Text("Would you like to Sign out to SayHi"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _signOut() async {

    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => const Login()),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       tooltip: 'Open shopping cart',
      //       onPressed: () {
      //         // handle the press
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.message_outlined),
      //       tooltip: 'Open shopping cart',
      //       onPressed: () {
      //         // handle the press
      //       },
      //     ),
      //   ],
      //     leading: Builder(
      //       builder: (BuildContext context) {
      //         return IconButton(
      //           icon: const Icon(Icons.logout),
      //           onPressed: () {
      //             showAlertDialog(context);
      //           },
      //         );
      //       },
      //     ),
      //     title: const Text('Say Hi'),
      //     backgroundColor: Colors.deepPurple
      // ),
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