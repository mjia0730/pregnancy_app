import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/pregnancy_cycle.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/edit_pregnancy_cycle.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pregnancy_app/screen/food_recommendation.dart';

class Home extends StatefulWidget{
  final Users user;
  final pregnancyCycle pc;
  Home(this.user, this.pc);

  @override
  _HomeState createState() => _HomeState(user, pc);
}

class _HomeState extends State<Home>{
  final Users user;
  final pregnancyCycle pc;
  _HomeState(this.user, this.pc);
  int week = 0;

  @override
  Widget build(BuildContext context){
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMd().format(now);
    String day = DateFormat.EEEE().format(now);

    if(pc.first_day != ''){
      var pregnancy_date = DateTime.parse(pc.first_day);
      DateTime last_day = pregnancy_date.add(Duration(days: 280)).toLocal();
      int remaining_day = last_day.difference(now).inDays;
      week = remaining_day%7;
    }
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homepage',
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
      ),

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height:180,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color:pink.withOpacity(0.4),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.01),
                        Text('Hi, ${user.username}!',
                        style: const TextStyle(
                          color: black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2, color: pink),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.01, width: MediaQuery.of(context).size.width*0.5),
                              Text(date,
                              style: const TextStyle(
                                color: black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01, width: MediaQuery.of(context).size.width*0.5),
                              Text(day,
                              style: const TextStyle(
                                color: pink,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //'Daily Highlights'
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      const Text('Daily Highlights',
                      style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.start,),

                      //Pregnancy Cycle
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: pink),
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                                Container(
                                  width: 13.33,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('android/assets/pregnancy_cycle.png'),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.05),
                                const Text('Pregnancy Cycle',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.center,)
                              ],
                            ),

                            //Progress Circle or Button
                            SizedBox(height: MediaQuery.of(context).size.height*0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(pc.first_day == '')...[
                                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*1.2,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: pink,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8))),
                                        onPressed:() => Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EditPregnancyCycle(user)),
                                        ),
                                        child: const Text('Edit Pregnancy Cycle', textAlign: TextAlign.center,),
                                      ),
                                    ),
                                ] else ... [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: CircularPercentIndicator(
                                          radius: 40.0,
                                          lineWidth: 10.0,
                                          animation: true,
                                          percent: week/40,
                                          center: Text(
                                            'Week $week', style: const TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              color: black
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          backgroundColor: Colors.grey,
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: pink,
                                        )
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                                      Column(
                                        children: [
                                          const Text('Phase',
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500
                                            ),
                                            textAlign: TextAlign.start,),
                                          SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                          if(week<12 == true)...[
                                            const Text('First Trimester',
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500
                                            )),
                                          ] else if (week < 24 == true)...[
                                            const Text('Second Trimester',
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500
                                            )),
                                          ] else ... [
                                            const Text('Third Trimester',
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300
                                            )),
                                          ],
                                          SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                          const Text('Milestone',
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500
                                            )),
                                          SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                          Text('${40-week} weeks to go!',
                                            style: const TextStyle(
                                              color: black,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300
                                            )),
                                        ],
                                      )
                                    ],
                                  ),

                                  //Divider
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                  const Divider(
                                    color: pink,
                                  ),

                                  //'Discover your recommended food supplement now!'
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                  const Text('Discover your recommended food supplement now!',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500
                                  )),

                                  //Button 
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height*0.05,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: pink,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8))),
                                        onPressed:() => Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => FoodRecommendation(user)),
                                        ),
                                        child: const Text("Know More >>", style: TextStyle(color: black), textAlign: TextAlign.center,),
                                      ),
                                    ),
                                ],
          
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            )
          ),
        ),
      )
    );
  }
}