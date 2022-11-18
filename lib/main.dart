import 'package:flutter/material.dart';
import 'package:sayhi/views/credentials/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp;
    options: DefaultFirebaseOptions.currentPlatform;

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0x00ff9899),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          primaryColorDark: Colors.blueGrey,
          cardColor: Colors.blueGrey,
          backgroundColor: Colors.black54,
          errorColor: Colors.red
        )
      ),
      darkTheme: ThemeData.dark(
      ),
      home: Login(),
    );
  }
}
