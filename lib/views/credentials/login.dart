import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 200.0,),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Login Text///////////////////////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Log-in',
                              style: GoogleFonts.robotoSlab(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        //Email text Field///////////////////////////////////////////////////////////////
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black
                            ),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blueGrey)
                                ),
                                hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18
                              )
                            ),
                          ),
                        ),

                        //Password Text Field///////////////////////////////////////////////////////////////
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.black
                            ),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey)
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18
                                )
                            ),
                          ),
                        ),

                        //Login Text///////////////////////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(top: 12,right: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                                fontSize: 18
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    ),);
  }
}
