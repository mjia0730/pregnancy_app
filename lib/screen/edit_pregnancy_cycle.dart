import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class EditPregnancyCycle extends StatefulWidget{
  final Users user;
  final Disease disease;
  EditPregnancyCycle(this.user, this.disease);

  @override
  _EditPregnancyCycleState createState() => _EditPregnancyCycleState(user, disease);
}

class _EditPregnancyCycleState extends State<EditPregnancyCycle>{

  final Users user;
  final Disease disease;
  _EditPregnancyCycleState(this.user, this.disease);
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pregnancy Cycle',
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
                SizedBox(height: MediaQuery.of(context).size.height*0.05),

                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //first_day
                      const Text('First day of your last period: ',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: 'yyyy-mm-dd'
                        ),
                        onChanged: (value) {
                          setState(() {
                            disease.first_day = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter the first day of your last period";
                          }else{
                            return null;
                          }
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
                              onPressed: _formKey.currentState == null ||
                                        !_formKey.currentState!.validate()
                                    ? null
                                    : () async{
                                  try{
                                    
                                    final now = DateTime.now();
                                    List<String> s = disease.first_day.split('-');
                                    final day = DateTime(int.parse(s.elementAt(0)), int.parse(s.elementAt(1)), int.parse(s.elementAt(2)));
                                    disease.weeks_pregnant = (now.difference(day).inDays / 7).ceil();

                                    await _firestore.collection('user').doc(user.uid).update({
                                      'first_day': disease.first_day,
                                      'weeks_pregnant': disease.weeks_pregnant
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
                          child: const Text("Edit Pregnancy Cycle", textAlign: TextAlign.center,),
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