import 'package:flutter/material.dart';
import 'package:sayhi/views/credentials/forgetpass.dart';
import 'package:sayhi/views/credentials/newaccount.dart';

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
        backgroundColor: Colors.blueGrey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 200.0,
            ),
            child: SingleChildScrollView(
              child: Card(
                color: Colors.blueGrey.shade100,
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
                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 18),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Log-in',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        //Email Block ////////////////////////////////////////////
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Email text Field///////////////////////////////////////////////////////////////
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueGrey)),
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        //Password block//////////////////////////////////////////
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Password Text Field///////////////////////////////////////////////////////////////
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueGrey)),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[700],
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

                        //Text Don't have an account? Sign up
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const NewAccount()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blueGrey[800]),
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
                                      color: Colors.blueGrey.shade800,
                                      thickness: 2,
                                    )
                                ),

                                const Text(
                                    " or login with ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16
                                  ),
                                ),

                                Expanded(
                                    child: Divider(
                                      color: Colors.blueGrey.shade800,
                                      thickness: 2,
                                    )
                                ),
                              ]
                          ),
                        ),

                        //fb logo/////////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(top: 40,bottom: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Continue with facebook ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
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
