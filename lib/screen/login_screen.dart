import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/screen/homescreen.dart';
import 'package:pregnancy_app/screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;


class _LoginScreenState extends State<LoginScreen>{
  late String email;
  late String password;
  bool sign_in = false;
  bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    getEmailandPassword();
  }

  getEmailandPassword() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getString('email') != null && pref.getString('password') != null){
      email = pref.getString('email').toString();
      password = pref.getString('password').toString();
      _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  setEmailandPassword() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
    pref.setString('password', password);
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Sign Up
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                const Text('Sign In',
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
                const Text("If you don't have an account ",
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
                      MaterialPageRoute(builder: (context)=> RegistrationScreen())
                    );
                  },
                  child: const Text(
                    "Sign Up here!",
                    style: TextStyle(color: yellow,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
                  ),
                ),

                //Form
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
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

                      SizedBox(height: MediaQuery.of(context).size.height*0.05),

                      Row(
                        children: <Widget>[
                          Theme(
                            data: ThemeData(unselectedWidgetColor: Colors.grey),
                            child: Checkbox(
                              value: _rememberMe,
                              checkColor: pink,
                              activeColor: Colors.grey,
                              onChanged: (value){
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ),
                          const Text('Remember Me', 
                            style: TextStyle(
                              color: black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400
                            )
                          )
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
                                  borderRadius: BorderRadius.circular(16))),
                          onPressed: _formKey.currentState == null ||
                                  !_formKey.currentState!.validate()
                              ? null
                              : () {
                                  _auth.signInWithEmailAndPassword(email: email, password: password);
                                  if(_rememberMe == true){
                                    setEmailandPassword();
                                  }
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                                },
                          child: const Text("Log In", textAlign: TextAlign.center,),
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