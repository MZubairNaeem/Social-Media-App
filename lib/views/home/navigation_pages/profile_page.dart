import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Profile Page...',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
                onPressed: (){
              _signOut();
            },
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
