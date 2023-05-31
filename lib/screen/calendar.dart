import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';  

class Calendar extends StatefulWidget{
  final Users user;
  Calendar(this.user);

  @override
  _CalendarState createState() => _CalendarState(user);
}

class _CalendarState extends State<Calendar>{
  final Users user;
  _CalendarState(this.user);
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context){
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMd().format(now);
    String day = DateFormat.EEEE().format(now);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendar',
        style: TextStyle(
          color: black,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,),
        backgroundColor: pink.withOpacity(0.4),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('android/assets/icon/logo.png'),
        ),
        actions: [
          Container(
            child: Column(
              children: [
                Text(date,
                style: const TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Text(day,
                style: const TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400
                ),),
              ],
            )
          )
        ],
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