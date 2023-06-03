import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class EditOthers extends StatefulWidget {
  final Users user;
  final Disease disease;
  EditOthers(this.user, this.disease);

  @override
  _EditOthersState createState() => _EditOthersState(user, disease);
}

class _EditOthersState extends State<EditOthers> {
  final Users user;
  final Disease disease;
  _EditOthersState(this.user, this.disease);
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Others',
            style: TextStyle(
                color: black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: black),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(
              right: 20.0, left: 20.0, top: 60.0, bottom: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //gestational_diabetes_history
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Have Gestational Diabetes History? ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Checkbox(
                            value: disease.gestational_diabetes_history,
                            onChanged: (value) {
                              setState(() {
                                disease.gestational_diabetes_history = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      //gingivitis
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Have Gingivitis? ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Checkbox(
                            value: disease.gingivitis,
                            onChanged: (value) {
                              setState(() {
                                disease.gingivitis = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      //family_history_heart_disease
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Have Family History Heart Disease? ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Checkbox(
                            value: disease.family_history_heart_disease,
                            onChanged: (value) {
                              setState(() {
                                disease.family_history_heart_disease = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      //chest_pain
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Have Chest Pain? ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Checkbox(
                            value: disease.chest_pain,
                            onChanged: (value) {
                              setState(() {
                                disease.chest_pain = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      //blurred_vision
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Have blurred vision? ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Checkbox(
                            value: disease.blurred_vision,
                            onChanged: (value) {
                              setState(() {
                                disease.blurred_vision = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      //floating_spots
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            'Have Floating Spots? ',
                            style: TextStyle(
                                color: black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Checkbox(
                            value: disease.floating_spots,
                            onChanged: (value) {
                              setState(() {
                                disease.floating_spots = value!;
                              });
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),

                      //Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1.2,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: pink,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: _formKey.currentState == null ||
                                  !_formKey.currentState!.validate()
                              ? null
                              : () async {
                                  try {
                                    await _firestore
                                        .collection('user')
                                        .doc(user.uid)
                                        .update({
                                      'gestational_diabetes_history':
                                          disease.gestational_diabetes_history,
                                      'gingivitis': disease.gingivitis,
                                      'hdlc_level': disease.hdlc_level,
                                      'family_history_heart_disease':
                                          disease.family_history_heart_disease,
                                      'chest_pain': disease.chest_pain,
                                      'blurred_vision': disease.blurred_vision,
                                      'floating_spots': disease.floating_spots
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Updated Successfully'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen(user, disease)));
                                  } on FirebaseException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.code),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  ;
                                },
                          child: const Text(
                            "Edit Pregnancy Cycle",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
