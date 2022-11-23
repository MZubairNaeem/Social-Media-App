import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sayhi/viewModel/storage_method.dart';


class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String bio,
      required String username,
      required Uint8List file
  }) async {
    String res = "Some error has occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty || bio.isNotEmpty || username.isNotEmpty ){
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password);

        print(cred.user!.uid);

        String photoURL = await StorageMethod().uploadImageToStorage('profilePic', file, false);
        //add user
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoURL,
        });
        res = "Success";
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }
}
