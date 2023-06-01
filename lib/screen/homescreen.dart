import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/pregnancy_cycle.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/calendar.dart';
import 'package:pregnancy_app/screen/home.dart';
import 'package:pregnancy_app/screen/profile.dart';

class HomeScreen extends StatefulWidget{
  final Users user;
  final pregnancyCycle pc;
  HomeScreen(this.user, this.pc);

  @override
  _HomeScreenState createState() => _HomeScreenState(user, pc);
}

class _HomeScreenState extends State<HomeScreen>{
  final Users user;
  final pregnancyCycle pc;
  _HomeScreenState(this.user, this.pc);
  int index = 0;

  @override
  Widget build(BuildContext context){
    final pageList = <Widget>[
      Home(user, pc),
      Calendar(user),
      Profile(user) 
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        elevation: 16.0,
        unselectedItemColor: black,
        selectedItemColor: pink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
      body: pageList[index],
    );
  }
}