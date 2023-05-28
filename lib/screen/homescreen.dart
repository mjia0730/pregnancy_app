import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pregnancy_app/model/users.dart';

class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Users user = Users(uid: '', username: '', email: '', password: '', age: '', marriage_year: '', num_children: '');

  @override
  Widget build(BuildContext context){

    _firestore.collection('user').doc(_auth.currentUser!.uid.toString()).get().then((value){
      user = Users(uid: _auth.currentUser!.uid, username: value.data()!['username'].toString(), 
        email: value.data()!['email'].toString(), password: value.data()!['password'].toString(),
        age: value.data()!['age'].toString(), marriage_year: value.data()!['marriage_year'].toString(),
        num_children: value.data()!['num_children'].toString());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username.toString()),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}