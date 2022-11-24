import 'package:flutter/material.dart';
import 'package:sayhi/views/credentials/forgetpass.dart';
import 'package:sayhi/views/credentials/newaccount.dart';
import 'package:sayhi/views/home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 200.0,
            ),
            child: SingleChildScrollView(
              child: Card(
                color: Colors.deepPurple[50],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Login Text//////////////////////////////////////////////
                         Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 18),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Log-in',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        //Email Block ////////////////////////////////////////////
                        Column(
                          children:  [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Email text Field///////////////////////////////////////////////////////////////
                            const TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.deepPurple)),
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        //Password block//////////////////////////////////////////
                        Column(
                          children:  [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Password Text Field///////////////////////////////////////////////////////////////
                            const TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.deepPurple)),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            ),
                          ],
                        ),

                        //forget password Text////////////////////////////////////
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ForgetPass()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 20, right: 5),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                    fontSize: 20,),
                              ),
                            ),
                          ),
                        ),

                        //login Button////////////////////////////////////////////
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //Text Don't have an account? Sign up
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade800,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewAccount()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.deepPurple[800]),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //--------------or login with-----------------
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                      color: Colors.deepPurple.shade800,
                                      thickness: 2,
                                    )
                                ),

                                 Text(
                                    " or login with ",
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16
                                  ),
                                ),

                                Expanded(
                                    child: Divider(
                                      color: Colors.deepPurple.shade800,
                                      thickness: 2,
                                    )
                                ),
                              ]
                          ),
                        ),

                        //fb logo/////////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(top: 40,bottom: 105),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                'Continue with facebook ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              Image.asset(
                                'lib/views/assets/fb_logo.png',
                                height: 20,
                                width: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
