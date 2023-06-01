import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class SignUpSuccess extends StatefulWidget{
  final Users user;
  SignUpSuccess(this.user);

  @override
  _SignUpSuccessState createState() => _SignUpSuccessState(user);

}

class _SignUpSuccessState extends State<SignUpSuccess>{
  final Users user;
  _SignUpSuccessState(this.user);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 60.0, bottom: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                //"Sign Up Successful"
                SizedBox(height: MediaQuery.of(context).size.height*0.1),
                const Text('Sign Up',
                  style: TextStyle(
                    color: pink,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600
                  ),
                ),

                const Text('Successful',
                  style: TextStyle(
                    color: pink,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600
                  ),
                ),

                //Image
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Container(
                  width: 105,
                  height: 210.05,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('android/assets/pregnant_lady.png'),
                          fit: BoxFit.fill)),
                ),

                //"Welcome to Pregnancy App"
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Text('Welcome to Pregnancy App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400
                  ),
                ),

                //Button
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
                      onPressed:() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user, Disease(first_day: '', bmi: 0.0, 
                      weeks_pregnant: 0, fatigue: false, one_hour_plasma_glucose_level: 0.0, gestational_diabetes_history: false, 
                      systolic_blood_pressure: 0, diastolic_blood_pressure: 0, haemoglobin_level: 0.0, calcium_level: 0.0, 
                      phosphate_level: 0.0, urine_protein_level: 0.0, blood_creatinine_level: 0.0, blood_urea_nitrogen_level: 0.0, 
                      vitamin_c_level: 0.0, gingivitis: false, ldlc_level: 0.0, hdlc_level: 0.0, family_history_heart_disease: false, 
                      chest_pain: false, blurred_vision: false, floating_spots: false)))),
                      child: const Text("Continue", textAlign: TextAlign.center,),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}