import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class EditBloodTest extends StatefulWidget{
  final Users user;
  final Disease disease;
  EditBloodTest(this.user, this.disease);

  @override
  _EditBloodTestState createState() => _EditBloodTestState(user, disease);
}

class _EditBloodTestState extends State<EditBloodTest>{

  final Users user;
  final Disease disease;
  _EditBloodTestState(this.user, this.disease);
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Blood Test',
        style: TextStyle(
          color: black,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black),
          onPressed: () => Navigator.of(context).pop(),
        )
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

                //1_hour_plasma_glucose_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('1 Hour Plasma Glucose Level:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mg/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.one_hour_plasma_glucose_level = double.parse(value);
                    });
                  },
                ),
                //systolic_blood_pressure
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Systolic Blood Pressure:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mm Hg)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.systolic_blood_pressure = int.parse(value);
                    });
                  },
                ),

                //diastolic_blood_pressure
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Diastolic Blood Pressure:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mm Hg)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.diastolic_blood_pressure = int.parse(value);
                    });
                  },
                ),

                //haemoglobin_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Haemoglobin Level:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(g/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.haemoglobin_level = double.parse(value);
                    });
                  },
                ),

                //calcium_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Calcium Level:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mg/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.calcium_level = double.parse(value);
                    });
                  },
                ),

                //phosphate_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Phosphate Level:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mg/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.phosphate_level = double.parse(value);
                    });
                  },
                ),

                //blood_creatinine_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Blood Creatinine Level: ',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mg/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.blood_creatinine_level = double.parse(value);
                    });
                  },
                ),

                //blood_urea_nitrogen_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Blood Urea Nitrogen Level: ',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mg/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.blood_urea_nitrogen_level = double.parse(value);
                    });
                  },
                ),

                //vitamin_c_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Vitamin C Level:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mg/dL)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.vitamin_c_level = double.parse(value);
                    });
                  },
                ),

                //ldlc_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('LDLC Level:',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.left,
                  decoration: TextFieldDecoration.copyWith(
                    hintText: '(mmol/L)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.ldlc_level = double.parse(value);
                    });
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.05),

                //Button
                SizedBox(
                  width: MediaQuery.of(context).size.width*1.2,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: pink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                        onPressed: () async{
                            try{
                              await _firestore.collection('user').doc(user.uid).update({
                                '1_hour_plasma_glucose_level': disease.one_hour_plasma_glucose_level,
                                'systolic_blood_pressure': disease.systolic_blood_pressure,
                                'diastolic_blood_pressure': disease.diastolic_blood_pressure,
                                'haemoglobin_level': disease.haemoglobin_level,
                                'calcium_level': disease.calcium_level,
                                'phosphate_level': disease.phosphate_level,
                                'blood_creatinine_level': disease.blood_creatinine_level,
                                'blood_urea_nitrogen_level': disease.blood_urea_nitrogen_level,
                                'vitamin_c_level': disease.vitamin_c_level,
                                'ldlc_level': disease.ldlc_level,
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Updated Successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );


                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user,disease)));
                              
                            } on FirebaseException catch (e){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.code),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            };
                          },
                    child: const Text("Edit", textAlign: TextAlign.center,),
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