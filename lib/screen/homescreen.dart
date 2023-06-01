import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/food_recommendation.dart';
import 'package:pregnancy_app/screen/home.dart';
import 'package:pregnancy_app/screen/profile.dart';

class HomeScreen extends StatefulWidget{
  final Users user;
  final Disease disease;
  HomeScreen(this.user, this.disease);

  @override
  _HomeScreenState createState() => _HomeScreenState(user, disease);
}

class _HomeScreenState extends State<HomeScreen>{
  final Users user;
  final Disease disease;
  _HomeScreenState(this.user, this.disease);
  int index = 0;

  @override
  Widget build(BuildContext context){
    final pageList = <Widget>[
      Home(user, disease),
      FoodRecommendation(user),
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
            icon: Icon(Icons.food_bank),
            label: 'Food Recommendation',
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