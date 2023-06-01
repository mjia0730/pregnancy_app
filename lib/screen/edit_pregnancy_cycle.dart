import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/pregnancy_cycle.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/home.dart';
import 'package:pregnancy_app/screen/homescreen.dart';

class EditPregnancyCycle extends StatefulWidget{
  final Users user;
  EditPregnancyCycle(this.user);

  @override
  _EditPregnancyCycleState createState() => _EditPregnancyCycleState(user);
}

class _EditPregnancyCycleState extends State<EditPregnancyCycle>{

  final Users user;
  _EditPregnancyCycleState(this.user);
  String first_day = '', weight = '', height = ''; 
  final _firestore = FirebaseFirestore.instance;

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
                
                //first_day
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
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
                      first_day = value;
                    });
                  },
                ),

                //height
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Text('Height: ',
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
                    hintText: '(m)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                  },
                ),

                //weight
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Text('Weight: ',
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
                    hintText: '(kg)'
                  ),
                  onChanged: (value) {
                    setState(() {
                      weight = value;
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
                              await _firestore.collection('pregnancy_cycle').add({
                                'uid': user.uid,
                                'first_day': first_day,
                                'weight': weight,
                                'height': height
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Updated Successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );

                              pregnancyCycle pc = pregnancyCycle(first_day: first_day, weight: weight, height: height);

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(user,pc)));
                              
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
          ),

        ),
      ),
    );
  }
}