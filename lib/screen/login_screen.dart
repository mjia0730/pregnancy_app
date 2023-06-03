import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/diseases.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/homescreen.dart';
import 'package:pregnancy_app/screen/login_success.dart';
import 'package:pregnancy_app/screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;


class _LoginScreenState extends State<LoginScreen>{
  late String email;
  late String password;
  Users user = Users(uid:'', username: '', email: '', password: '', age: '', emergency_contact: '', marriage_year: '', num_children: '');
  Disease disease = Disease(first_day: '', bmi: 0.0, weeks_pregnant: 0, fatigue: false, one_hour_plasma_glucose_level: 0.0, 
  gestational_diabetes_history: false, systolic_blood_pressure: 0, diastolic_blood_pressure: 0, haemoglobin_level: 0.0, calcium_level: 0.0, 
  phosphate_level: 0.0, urine_protein_level: 0.0, blood_creatinine_level: 0.0, blood_urea_nitrogen_level: 0.0, vitamin_c_level: 0.0, 
  gingivitis: false, ldlc_level: 0.0, hdlc_level: 0.0, family_history_heart_disease: false, chest_pain: false, blurred_vision: false, floating_spots: false);
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

                if(disease.first_day != ''){
                  disease.first_day = value['first_day'];
                  disease.weeks_pregnant = value['weeks_pregnant'];
                  disease.bmi = value['bmi'].toDouble();
                  disease.weeks_pregnant = value['weeks_pregnant'];
                  disease.fatigue = value['fatigue'];
                  disease.one_hour_plasma_glucose_level = value['1_hour_plasma_glucose_level'].toDouble();
                  disease.gestational_diabetes_history = value['gestational_diabetes_history'];
                  disease.systolic_blood_pressure = value['systolic_blood_pressure'];
                  disease.diastolic_blood_pressure = value['diastolic_blood_pressure'];
                  disease.haemoglobin_level = value['haemoglobin_level'].toDouble();
                  disease.calcium_level = value['calcium_level'].toDouble();
                  disease.phosphate_level = value['phosphate_level'].toDouble();
                  disease.urine_protein_level = value['urine_protein_level'].toDouble();
                  disease.blood_creatinine_level = value['blood_creatinine_level'].toDouble();
                  disease.blood_urea_nitrogen_level = value['blood_urea_nitrogen_level'].toDouble();
                  disease.vitamin_c_level = value['vitamin_c_level'].toDouble();
                  disease.gingivitis = value['gingivitis'];
                  disease.ldlc_level = value['ldlc_level'].toDouble();
                  disease.hdlc_level = value['hdlc_level'].toDouble();
                  disease.family_history_heart_disease = value['family_history_heart_disease'];
                  disease.chest_pain = value['chest_pain'];
                  disease.blurred_vision = value['blurred_vision'];
                  disease.floating_spots = value['floating_spots'];

                }

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSuccess(user, disease)));
            });
            });
        });
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
                const Text("If you don't have an account? ",
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                  )
                ),

                //You can Sign in here!
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> const RegistrationScreen())
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //email
                      SizedBox(height: MediaQuery.of(context).size.height*0.03),
                      const Row(
                        children: [
                          SizedBox(width: 8),
                          Text('Email',
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
                      const Row(
                        children: [
                          SizedBox(width: 8),
                          Text('Password',
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
                              : () async{
                                  try{
                                    await _auth.signInWithEmailAndPassword(email: email, password: password);
                                    if(_rememberMe == true){
                                      setEmailandPassword();
                                    }
                                    
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
                                            
                                            if(value['first_day'] != ''){
                                              disease.first_day = value['first_day'];
                                              disease.weeks_pregnant = value['weeks_pregnant'];
                                              disease.bmi = value['bmi'].toDouble();
                                              disease.fatigue = value['fatigue'];
                                              disease.one_hour_plasma_glucose_level = value['1_hour_plasma_glucose_level'].toDouble();
                                              disease.gestational_diabetes_history = value['gestational_diabetes_history'];
                                              disease.systolic_blood_pressure = value['systolic_blood_pressure'];
                                              disease.diastolic_blood_pressure = value['diastolic_blood_pressure'];
                                              disease.haemoglobin_level = value['haemoglobin_level'].toDouble();
                                              disease.calcium_level = value['calcium_level'].toDouble();
                                              disease.phosphate_level = value['phosphate_level'].toDouble();
                                              disease.urine_protein_level = value['urine_protein_level'].toDouble();
                                              disease.blood_creatinine_level = value['blood_creatinine_level'].toDouble();
                                              disease.blood_urea_nitrogen_level = value['blood_urea_nitrogen_level'].toDouble();
                                              disease.vitamin_c_level = value['vitamin_c_level'].toDouble();
                                              disease.gingivitis = value['gingivitis'];
                                              disease.ldlc_level = value['ldlc_level'].toDouble();
                                              disease.hdlc_level = value['hdlc_level'].toDouble();
                                              disease.family_history_heart_disease = value['family_history_heart_disease'];
                                              disease.chest_pain = value['chest_pain'];
                                              disease.blurred_vision = value['blurred_vision'];
                                              disease.floating_spots = value['floating_spots'];

                                            }

                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSuccess(user, disease)));
                                        });
                                        });
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.code),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
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