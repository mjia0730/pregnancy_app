import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/calendar.dart';
import 'package:pregnancy_app/screen/home.dart';
import 'package:pregnancy_app/screen/profile.dart';

class Education extends StatefulWidget{
  final Users user;
  Education(this.user);

  @override
  _EducationState createState() => _EducationState(user);
}

class _EducationState extends State<Education>{
  final Users user;
  _EducationState(this.user);


  @override
  Widget build(BuildContext context){
    final pageList = <Widget>[
      Home(user),
      Calendar(user),
      Education(user),
      Profile(user) 
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Education',
        style: TextStyle(
          color: black,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('android/assets/icon/logo.png'),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 60.0, bottom: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                
              ],
            ),
          ),
        ),
      )
    );
  }
}