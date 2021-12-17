import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Shares').snapshots(),
        builder: (context, snapshots) {

          if(!snapshots.hasData) {
            return CircularProgressIndicator();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshots.data.documents.toString()),
              ],
            ),
          );
        },
      ),
    );
    throw UnimplementedError();
  }
}