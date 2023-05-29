
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/login_screen.dart';
import 'package:pregnancy_app/screen/signup_success_screen.dart';

class RegistrationScreen extends StatefulWidget{
  
  const RegistrationScreen({
    super.key
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>{
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String username = "";
  String email = "";
  String password = "";
  String age = "";
  String emergency_contact = "";
  String marriage_year = "";
  String num_children = "";
  final _formKey = GlobalKey<FormState>();
  var confirmPass;

  Users user = Users(uid:'', username: '', email: '', password: '', age: '', emergency_contact: '', marriage_year: '', num_children: '');

  @override
  Widget build(BuildContext context){
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
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

                //Sign Up
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                const Text('Sign Up',
                  style: TextStyle(
                    color: pink,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600
                  )
                ),

                //If you have an account
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                const Text("If you have an account ",
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400
                  )
                ),

                //You can Sign in here!
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                const Text('You can ',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400
                  )
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> const LoginScreen())
                    );
                  },
                  child: const Text(
                    "Sign in here!",
                    style: TextStyle(color: yellow,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
                  ),
                ),

                //Form
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //username
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('Username',
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
                          hintText: 'admin'
                        ),
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter username";
                          }else{
                            return null;
                          }
                        },
                      ),

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
                      TextFormField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: 'username@gmail.com'
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter email";
                          }else{
                            return null;
                          }
                        },
                      ),

                      //Password
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('Password',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: '********'
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter password";
                          }else{
                            return null;
                          }
                        },
                      ),

                      //Confirm Password
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      const Text('Confirm your password',
                        style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: TextFieldDecoration.copyWith(
                          hintText: '********'
                        ),
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please re-enter password";
                          }
                          else if (value != password){
                            return "Password must be same as above";
                          }
                          else{
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
                          hintText: 'Your age'
                        ),
                        onChanged: (value) {
                          setState(() {
                            age = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter age";
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
                          hintText: '01*-*******'
                        ),
                        onChanged: (value) {
                          setState(() {
                            emergency_contact = value;
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
                          hintText: 'How long have you been married?'
                        ),
                        onChanged: (value) {
                          setState(() {
                            marriage_year = value;
                          });
                        },
                        validator: (value) {
                          if(value == "" || value == null){
                            return "Please enter how long have you been married?";
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
                          hintText: 'How many children do you have?'
                        ),
                        onChanged: (value) {
                          setState(() {
                            num_children = value;
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
                                    await auth.createUserWithEmailAndPassword(email: email, password: password);
                                    _auth.currentUser?.reload();
                                    firestore.collection('user').add({
                                      'username': username,
                                      'email': email,
                                      'password': password,
                                      'age': age,
                                      'emergency_contact': emergency_contact,
                                      'marriage_year': marriage_year,
                                      'num_children': num_children
                                    });
                                    _firestore.collection('user').where('email', isEqualTo: email)
                                    .where('password', isEqualTo: password).limit(1).get()
                                    .then((value) {
                                      value.docs.forEach((element) {
                                        _firestore.collection('user').doc(element.id)
                                        .get().then((value){
                                            user = Users(uid: element.id, username: value['username'].toString(), 
                                            email: value['email'].toString(), password: value['password'].toString(),
                                            age: value['age'].toString(), emergency_contact: value['emergency_contact'].toString(),
                                            marriage_year: value['marriage_year'].toString(),
                                            num_children: value['num_children'].toString());
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('success'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpSuccess(user)));
                                        });
                                        });
                                    });
                                    
                                  } on FirebaseAuthException catch (e){
                                    String text = '';
                                    if (e.code == "email-already-in-use") {
                                        text = "The email address is already in use";
                                    } else if (e.code == "invalid-email") {
                                        text = "The email address is not valid.";
                                    } else if (e.code == "operation-not-allowed") {
                                        text = "Operation not allowed.";
                                    } else if (e.code == "weak-password") {
                                        text = "The password is too weak.";
                                    } else{
                                        text = e.code;
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(text),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  };
                                },
                          child: const Text("Register", textAlign: TextAlign.center,),
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

  Users get getUsers{
    return user;
  }
}