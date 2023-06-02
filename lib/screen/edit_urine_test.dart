import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class EditUrineTest extends StatefulWidget{
  final Users user;
  final Disease disease;
  EditUrineTest(this.user, this.disease);

  @override
  _EditUrineTestState createState() => _EditUrineTestState(user, disease);
}

class _EditUrineTestState extends State<EditUrineTest>{

  final Users user;
  final Disease disease;
  _EditUrineTestState(this.user, this.disease);
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Urine Test',
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
                //urine_protein_level
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Urine Protein Level:',
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
                    hintText: '(mg/24 hours)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      disease.urine_protein_level = double.parse(value);
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
                                
                                'urine_protein_level': disease.urine_protein_level,
                                
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