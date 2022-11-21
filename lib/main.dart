import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'Say Hi',
      theme: ThemeData(
          fontFamily: GoogleFonts.varelaRound().fontFamily,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          primaryColorDark: Colors.blueGrey,
          cardColor: Colors.blueGrey,
          backgroundColor: Colors.black54,
          errorColor: Colors.red
        )
      ),
      darkTheme: ThemeData.dark(
      ).copyWith(
        focusColor: Colors.blueGrey,
          primaryColorDark: Colors.blueGrey,
          cardColor: Colors.blueGrey,
          backgroundColor: Colors.black54,
          errorColor: Colors.red,
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: GoogleFonts.varelaRound().fontFamily,
          displayColor: Colors.black

        ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: GoogleFonts.varelaRound().fontFamily,
        ),
      ),
      home: Login(),
    );
  }
}
