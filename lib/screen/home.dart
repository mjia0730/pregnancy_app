import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/edit_blood_test.dart';
import 'package:pregnancy_app/screen/edit_general.dart';
import 'package:pregnancy_app/screen/edit_others.dart';
import 'package:pregnancy_app/screen/edit_pregnancy_cycle.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pregnancy_app/screen/edit_urine_test.dart';

class Home extends StatefulWidget {
  final Users user;
  final Disease disease;
  Home(this.user, this.disease);

  @override
  _HomeState createState() => _HomeState(user, disease);
}

class _HomeState extends State<Home> {
  final Users user;
  final Disease disease;
  _HomeState(this.user, this.disease);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMd().format(now);
    String day = DateFormat.EEEE().format(now);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Homepage',
            style: TextStyle(
                color: black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
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
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: pink.withOpacity(0.4),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'Hi, ${user.username}!',
                          style: const TextStyle(
                              color: black,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2, color: pink),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5),
                              Text(
                                date,
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5),
                              Text(
                                day,
                                style: const TextStyle(
                                    color: pink,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const Text(
                        'Daily Highlights',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      //Pregnancy Cycle
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2, color: pink),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05),
                                Container(
                                  width: 13.33,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'android/assets/pregnancy_cycle.png'),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05),
                                const Text(
                                  'Pregnancy Cycle',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),

                            //Progress Circle or Button
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (disease.first_day == '') ...[
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1.2,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: pink,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditPregnancyCycle(
                                                    user, disease)),
                                      ),
                                      child: const Text(
                                        'Edit Pregnancy Cycle',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ] else ...[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 50.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: disease.weeks_pregnant / 40,
                                        center: Text(
                                          'Week ${disease.weeks_pregnant}',
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              color: black),
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: Colors.grey,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: pink,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      Column(
                                        children: [
                                          const Text(
                                            'Phase :',
                                            style: TextStyle(
                                                color: black,
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          if (disease.weeks_pregnant < 12 ==
                                              true) ...[
                                            const Text('First Trimester',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ] else if (disease.weeks_pregnant <
                                                  24 ==
                                              true) ...[
                                            const Text('Second Trimester',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ] else ...[
                                            const Text('Third Trimester',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          const Text('Milestone',
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          Text(
                                              '${40 - disease.weeks_pregnant} weeks to go!',
                                              style: const TextStyle(
                                                  color: black,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      )
                                    ],
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
                Container(
                  margin: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //General
                      if (disease.bmi == 0.0) ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('General',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditGeneral(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ] else ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('General',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),

                                //BMI
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Row(
                                  children: [
                                    const Text('BMI: ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.bmi.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //weeks_pregnant
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('Weeks of Pregnancy: ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.weeks_pregnant.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //fatigue
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    if (disease.fatigue == true) ...[
                                      const Text('You\'re feeling fatigue',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text('You\'re not feeling fatigue',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //edit button
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditGeneral(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],

                      //Blood Test
                      if (disease.one_hour_plasma_glucose_level == 0.0) ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Blood Test',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditBloodTest(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ] else ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Blood Test',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),

                                //1_hour_plasma_glucose_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Row(
                                  children: [
                                    const Text(
                                        '1 Hour Plasma Glucose Level (mg/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(
                                        disease.one_hour_plasma_glucose_level
                                            .toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //systolic_blood_pressure
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text(
                                        'Systolic Blood Pressure (mm Hg): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(
                                        disease.systolic_blood_pressure
                                            .toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //diastolic_blood_pressure
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text(
                                        'Diastolic Blood Pressure (mm Hg): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(
                                        disease.diastolic_blood_pressure
                                            .toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //haemoglobin_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('Heamoglobin Level (g/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.haemoglobin_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //calcium_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('Calcium Level (mg/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.calcium_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //Phosphate Level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('Phosphate Level (mg/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.phosphate_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //blood_creatinine_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text(
                                        'Blood Creatinine Level (mg/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(
                                        disease.blood_creatinine_level
                                            .toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //blood_urea_nitrogen_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text(
                                        'Blood Urea Nitrogen Level (mg/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(
                                        disease.blood_urea_nitrogen_level
                                            .toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //vitamin_c_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('Vitamin C Level (mg/dL): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.vitamin_c_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //ldlc_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('LDLC Level (mmol/L): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.ldlc_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //hdlc_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    const Text('HDLC Level (mmol/L): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.hdlc_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //edit button
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditBloodTest(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],

                      //Urine Test
                      if (disease.urine_protein_level == 0.0) ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Urine Test',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditUrineTest(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ] else ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Urine Test',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),

                                //urine_protein_level
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Row(
                                  children: [
                                    const Text(
                                        'Urine Protein Level (mg/24 hours): ',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    Text(disease.urine_protein_level.toString(),
                                        style: const TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),

                                //edit button
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditUrineTest(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],

                      //Others
                      if (disease.hdlc_level == 0.0) ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Others',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditOthers(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ] else ...[
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.pink),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Others',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500)),

                                //gestational_diabetes_history
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    if (disease.gestational_diabetes_history ==
                                        true) ...[
                                      const Text(
                                          'Have Gestational Diabetes History',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text(
                                          'No Gestational Diabetes History',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //gingivitis
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    if (disease.gingivitis == true) ...[
                                      const Text('Have Gingivitis',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text('No Gingivitis',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //family_history_heart_disease
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    if (disease.family_history_heart_disease ==
                                        true) ...[
                                      const Text(
                                          'Have Family History Heart Disease',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text(
                                          'No Family History Heart Disease',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //chest_pain
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    if (disease.chest_pain == true) ...[
                                      const Text('Have Chest Pain',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text('No Chest Pain',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //blurred vision
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    if (disease.blurred_vision == true) ...[
                                      const Text('Have Blurred Vision',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text('No Blurred Vision',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //floating_spots
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    if (disease.floating_spots == true) ...[
                                      const Text('Have Floating Spots',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ] else ...[
                                      const Text('No Floating Spots',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500)),
                                    ]
                                  ],
                                ),

                                //edit button
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditOthers(user, disease)),
                                    ),
                                    child: const Text(
                                      'Edit',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
