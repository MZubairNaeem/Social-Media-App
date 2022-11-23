import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayhi/viewModel/auth_method.dart';
import 'package:sayhi/views/ui_logic/image_picker.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {

  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  Uint8List? _image;


  @override
  void initState() {
    Firebase.initializeApp;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
  }

  void SelectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

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
                color: Colors.deepPurple.shade50,
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

                        //profile picture///////////////////////////////////////////////
                        Center(
                          child: Stack(
                            children: [
                              _image != null ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage: MemoryImage(_image!)
                              )
                              : const CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1669110206~exp=1669110806~hmac=97fb91bc3335ec062f420f5c48432c4e61f28568eb4204b6ebade6f4d2c9bfaf'),
                              ),
                              Positioned(
                                bottom: -10,
                                left: 50,
                                child: IconButton(
                                  onPressed: () {
                                    SelectImage();
                                  },
                                  icon: const Icon(Icons.add_a_photo,
                                    color: Colors.pink,),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        //userName Block ///////////////////////////////////////////
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Email text Field///////////////////////////////////////////////////////////////
                            TextField(
                              controller: _usernameController,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                                  hintText: 'Enter Your Username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        //enter bio///////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Bio',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //bio text Field///////////////////////////////////////////////////////////////
                              TextField(
                                maxLength: 80,
                                maxLines: 4,
                                controller: _bioController,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                    hintText: 'Tell people about yourself',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 18)),
                              ),
                            ],
                          ),
                        ),

                        //Email Block //////////////////////////////////////////
                        Column(
                          children: [
                            const Align(
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
                              controller: _emailController,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                                  hintText: 'Enter Your Email Address',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //password block////////////////////////////////////////
                        Column(
                          children: [
                            const Align(
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
                              controller: _passController,
                              obscureText: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                                  hintText: 'Enter a Password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                            ),

                          ],
                        ),

                        //Submit Button/////////////////////////////////////////
                        GestureDetector(
                          onTap: () async {

                            String res = await AuthMethod().signUpUser(
                              email: _emailController.text,
                              password: _passController.text,
                              bio: _bioController.text,
                              username: _usernameController.text,
                              file: _image! ,
                            );
                            Navigator.pop(context);
                            print(res);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
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
