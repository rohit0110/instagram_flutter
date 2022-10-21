import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //sign up user
  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Error occured hahaha";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //add to db
        _firestore.collection('users').doc(cred.user!.uid).set({
          "username": username,
          "uid": cred.user!.uid,
          "bio": bio,
          "email": email,
          "followers": [],
          "following": []
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
