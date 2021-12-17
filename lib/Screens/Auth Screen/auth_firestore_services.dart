import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AuthFireServices {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireatoreDb = FirebaseFirestore.instance;

  Future<bool> logIn(String email, String password) async {

    UserCredential user;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;

    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> register({String email,String password,String contact,String name}) async {

    UserCredential user;

    try {

       user = await auth.createUserWithEmailAndPassword(email: email, password: password);

       Map<String,String> data = {
         'name':'$name',
         'email':'$email',
         'contact':'$contact'
       };

       fireatoreDb.collection('Users').doc(user.user.uid).set(data);

       print('User Created');

       return true;
    } catch(e) {

      print('error = ${e.toString()}');
      return false;
    }


  }
}
