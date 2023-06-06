import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/meal.dart';
import 'package:pregnancy_app/model/users.dart';
import '../model/diseases.dart';
import 'package:pregnancy_app/screen/meal_detail_screen.dart';

class FoodRecommendation extends StatefulWidget {
  final Users user;
  final Disease disease;
  FoodRecommendation(this.user, this.disease);

  @override
  _FoodRecommendationState createState() =>
      _FoodRecommendationState(user, disease);
}

class _FoodRecommendationState extends State<FoodRecommendation> {
  final Users user;
  final Disease disease;

  List<String> recommendedMealIds = [];
  List<String> highRiskDiseases = [];
  _FoodRecommendationState(this.user, this.disease);
  CollectionReference meals = FirebaseFirestore.instance.collection('meal');

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url =
        Uri.parse('https://deployment-production-231e.up.railway.app/predict');

    String body = json.encode({
      "data": {
        "bmi": disease.bmi,
        "1_hour_plasma_glucose_level": disease.one_hour_plasma_glucose_level,
        "gestational_diabetes_history": disease.gestational_diabetes_history,
        "systolic_blood_pressure": disease.systolic_blood_pressure,
        "diastolic_blood_pressure": disease.diastolic_blood_pressure,
        "urine_protein_level": disease.urine_protein_level,
        "blurred_vision": disease.blurred_vision,
        "haemoglobin_level": disease.haemoglobin_level,
        "calcium_level": disease.calcium_level,
        "phosphate_level": disease.phosphate_level,
        "blood_creatinine_level": disease.blood_creatinine_level,
        "weeks_pregnant": disease.weeks_pregnant,
        "blood_urea_nitrogen_level": disease.blood_urea_nitrogen_level,
        "fatigue": disease.fatigue,
        "gingivitis": disease.gingivitis,
        "vitamin_c_level": disease.vitamin_c_level,
        "ldlc_level": disease.ldlc_level,
        "hdlc_level": disease.hdlc_level,
        "family_history_heart_disease": disease.family_history_heart_disease,
        "chest_pain": disease.chest_pain,
        "floating_spots": disease.floating_spots,
        "obesity": disease.obesity,
        "gestational_diabetes": disease.gestational_diabetes,
        "hypertension": disease.hypertension,
        "anaemia": disease.anaemia,
        "rickets": disease.rickets,
        "kidney_diseases": disease.kidney_diseases,
        "scurvy": disease.scurvy,
        "heart_disease": disease.heart_disease,
        "eye_disease": disease.eye_disease,
      },
    });

    // print(body);

    // Make the POST request
    http
        .post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    )
        .then((res) {
      if (res.statusCode == 200) {
        setState(() {
          recommendedMealIds =
              List<String>.from(json.decode(res.body)['meal_ids'])
                  .toSet()
                  .toList();
          highRiskDiseases =
              List<String>.from(json.decode(res.body)['diagnosis'])
                  .toSet()
                  .toList();
        });
        print(recommendedMealIds);
        print(highRiskDiseases);
      } else {
        throw Exception('Failed to load data');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Recommended Food',
              style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            backgroundColor: pink.withOpacity(0.4),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('android/assets/icon/logo.png'),
            )),
        body: StreamBuilder(
          stream: meals.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            List<String> highRiskDiseasesPrediction = [];
            for (var data in highRiskDiseases) {
              data = data.replaceAll("_", " ");
              highRiskDiseasesPrediction.add(data);
            }

            return Column(
              children: [
                Container(
                  height: 70.0, // Adjust the height as needed
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text('User High Risk :', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: highRiskDiseasesPrediction.length,
                          itemBuilder: (BuildContext context, int index) {
                            return IntrinsicWidth(
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                margin: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Text(
                                    highRiskDiseasesPrediction[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      // take the first 10 meals only
                      if (recommendedMealIds
                          .sublist(0, min(recommendedMealIds.length, 10))
                          .contains(snapshot.data?.docs[index]['Meal_Id'])) {
                        // print(snapshot.data?.docs[index]['Meal_Id']);
                        List<String> items = [];
                        if (snapshot.data?.docs[index]['Diet'] != null) {
                          String? array =
                              snapshot.data?.docs[index]['Diet'].toString();
                          List<String>? dietType = array?.split(" ");
                
                          int counter = 0;
                          for (var data in dietType!) {
                            data = data.replaceAll("_", " ");
                            items.add(data);
                            counter++;
                            if (counter == 5) break;
                          }
                        }
                
                        return InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 4, left: 4, right: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: pink),
                                color: Colors.white),
                            height: MediaQuery.of(context).size.height * 0.22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.03),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      child: Text(snapshot.data?.docs[index]['Name'],
                                          style: const TextStyle(
                                              color: black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      child: Wrap(
                                        spacing: 8.0,
                                        runSpacing: 8.0,
                                        children: items.map((item) {
                                          return IntrinsicWidth(
                                            child: Container(
                                              padding: const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[700],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        if (snapshot.data?.docs[index]['catagory'] !=
                                            null)
                                          IntrinsicWidth(
                                            child: Container(
                                              padding: const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[700],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  snapshot.data?.docs[index]
                                                      ['catagory'],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        const SizedBox(width: 10),
                                        if (snapshot.data?.docs[index]['Veg_Non'] ==
                                            'veg') ...[
                                          IntrinsicWidth(
                                            child: Container(
                                              padding: const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Veg',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ] else ...[
                                          IntrinsicWidth(
                                            child: Container(
                                              padding: const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Non-Veg',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Meal meal = Meal(
                                category: snapshot.data?.docs[index]['catagory'],
                                description: snapshot.data?.docs[index]
                                    ['description'],
                                diet: snapshot.data?.docs[index]['Diet'],
                                disease: snapshot.data?.docs[index]['Disease'],
                                meal_id: snapshot.data?.docs[index]['Meal_Id'],
                                name: snapshot.data?.docs[index]['Name'],
                                nutrient: snapshot.data?.docs[index]['Nutrient'],
                                price: snapshot.data!.docs[index]['Price'].toString(),
                                veg_non: snapshot.data?.docs[index]['Veg_Non']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MealDetailScreen(meal)),
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
