import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  String? gender;
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
                        //Create an Account Text////////////////////////////////
                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 18),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign-up',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        //Profile Picture///////////////////////////////////////
                        Column(
                          children: [
                            CircleAvatar(
                              minRadius: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Upload Photo',
                              ),
                            )
                          ],
                        ),

                        //Name Block ///////////////////////////////////////////
                        Column(
                          children: const [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Email text Field///////////////////////////////////////////////////////////////
                            TextField(
                              maxLength: 20,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                                  hintText: 'Enter Your Name',
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
                            ),
                          ],
                        ),

                        //Email Block //////////////////////////////////////////
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
                                  hintText: 'Enter Your Email Address',
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
                            ),
                          ],
                        ),

                        //gender Radio button block/////////////////////////////
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Male'
                                ),
                                Radio(value: "Male", groupValue: gender, onChanged:  (value){
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },),
                                Text(
                                    'Female'
                                ),
                                Radio(value: "Female", groupValue: gender, onChanged:  (value){
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },)
                              ],
                            ),
                          ],
                        ),

                        //Password block////////////////////////////////////////
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
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
                            ),

                            //Confirm Password Text Field///////////////////////////////////////////////////////////////
                            TextField(
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                                  hintText: 'Enter a Strong Password',
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey, fontSize: 18)),
                            ),
                          ],
                        ),

                        //Submit Button/////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[700],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),

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
