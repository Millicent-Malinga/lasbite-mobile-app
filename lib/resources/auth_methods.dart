// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'package:lasbite/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lasbite/resources/storage_methods.dart';

// implementing firebase authentication methods
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUserwithEmail({
    required String email,
    required String password,
    required String fullname,
    required String confirm,
  }) async {
    String res = "User created";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          fullname.isNotEmpty && confirm.isNotEmpty
          ) {
        // create user credentials for authentication
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
// upload image to storage

        // String photoUrl = await StorageMethods()
        //     .uploadImageToStorage('profilePics', profilePic, false);

        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          fullname: fullname,
          shared: [],
          received: [],
      
        );
        // create user in the Firestore firebase
        _firestore.collection('users').doc(cred.user!.uid).set(user.toMap());
    
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> LoginUserWithEmail(
      {required String email, required String password}) async {
    String res = "Some error occurred!";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // create user credentials for authentication
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "User signed in!";
        print(cred.user!.uid);
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
