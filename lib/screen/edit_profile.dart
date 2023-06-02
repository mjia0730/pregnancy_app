import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/profile.dart';

class EditProfile extends StatefulWidget{
  final Users user;
  EditProfile(this.user);

  @override
  _EditProfileState createState() => _EditProfileState(user);
}

class _EditProfileState extends State<EditProfile>{
  Users user;
  final _firestore = FirebaseFirestore.instance;
  _EditProfileState(this.user);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile',
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

                //email
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                const Text('Email',
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                  )
                ),
                Text(user.email,
                  style: const TextStyle(
                    color: black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                  )
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //username
                      const Text('Username',
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
                          hintText: user.username
                        ),
                        onChanged: (value) {
                          setState(() {
                            user.username = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter your username";
                          }else{
                            return null;
                          }
                        },
                      ),

                      //Age
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('Age:',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: user.age
                        ),
                        onChanged: (value) {
                          setState(() {
                            user.age = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter your age";
                          }else{
                            return null;
                          }
                        },
                      ),

                      //emergency_contact
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('Emergency Contact',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: user.emergency_contact
                        ),
                        onChanged: (value) {
                          setState(() {
                            user.emergency_contact = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter your emergency contact";
                          }else{
                            return null;
                          }
                        },
                      ),

                      //marriage_years
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('How long have you been married?',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: user.marriage_year
                        ),
                        onChanged: (value) {
                          setState(() {
                            user.marriage_year = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter how long have you been married";
                          }else{
                            return null;
                          }
                        },
                      ),

                      //num_children
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('How many children do you have?',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: user.num_children
                        ),
                        onChanged: (value) {
                          setState(() {
                            user.num_children = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter how many children do you have";
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
                                        await _firestore.collection('user').doc(user.uid).update({
                                          'username': user.username,
                                          'email': user.email,
                                          'age': user.age,
                                          'emergency_contact': user.emergency_contact,
                                          'marriage_year': user.marriage_year,
                                          'num_children': user.num_children
                                        });

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Updated Successfully'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );

                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile(user)));
                                        
                                      } on FirebaseException catch (e){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(e.code),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                },
                          child: const Text("Edit Profile", textAlign: TextAlign.center,),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      )
    );
  }
}