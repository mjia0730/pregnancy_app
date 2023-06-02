import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class EditGeneral extends StatefulWidget{
  final Users user;
  final Disease disease;
  EditGeneral(this.user, this.disease);

  @override
  _EditGeneralState createState() => _EditGeneralState(user, disease);
}

class _EditGeneralState extends State<EditGeneral>{

  final Users user;
  final Disease disease;
  _EditGeneralState(this.user, this.disease);
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('General',
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

                //bmi
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('BMI:',
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
                    hintText: 'Please input your BMI'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.bmi = double.parse(value);
                    });
                  },
                ),

                //fatigue
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Text('Feeling Fatigue? ',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05),
                    Checkbox(
                      value: disease.fatigue,
                      onChanged: (value) {
                        setState(() {
                          disease.fatigue = value!;
                        });
                      },
                    ),
                  ],
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
                                'bmi': disease.bmi,
                                'fatigue': disease.fatigue,
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