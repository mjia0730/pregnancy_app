import 'package:flutter/material.dart';
import 'package:pregnancy_app/model/users.dart';

class HomeScreen extends StatefulWidget{
  final Users user;
  HomeScreen(this.user);

  @override
  _HomeScreenState createState() => _HomeScreenState(user);
}

class _HomeScreenState extends State<HomeScreen>{
  final Users user;
  _HomeScreenState(this.user);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.white,
      ),
    );
  }
}