import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/edit_profile.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_app/screen/login_screen.dart';

class Profile extends StatefulWidget{
  final Users user;

  Profile(this.user);

  @override
  _ProfileState createState() => _ProfileState(user);
}

class _ProfileState extends State<Profile>{
  final Users user;
  _ProfileState(this.user);

  @override
  Widget build(BuildContext context){
    
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMd().format(now);
    String day = DateFormat.EEEE().format(now);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile',
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
        actions: [
          Container(
            child: Column(
              children: [
                Text(date,
                style: const TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Text(day,
                style: const TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400
                ),),
              ],
            )
          )
        ],
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
                //Profile Pic
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100,
                  
                ),

                //Profile Box
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: pink),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    children: [

                      //'Personal Info'
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      const Text('Personal Info',
                      style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600
                      ),),
                      
                      //Divider
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      const Divider(
                        color: pink,
                      ),
                      
                      //Username
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Text('Username: ${user.username}',
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                      ),),

                      //email
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Text('Email: ${user.email}',
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                      ),),

                      //Age
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Text('Age: ${user.age}',
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                      ),),

                      //Emergency Contact
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Text('Emergency Contact: ${user.emergency_contact}',
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                ),

                //Edit Button
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width*1.2,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: pink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile(user)),
                      );
                    },
                    child: const Text("Edit", textAlign: TextAlign.center,),
                  ),
                ),

                //Sign Out Button
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width*1.2,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: pink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: const Text("Sign Out", textAlign: TextAlign.center,),
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