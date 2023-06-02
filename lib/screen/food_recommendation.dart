import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/meal.dart';
import 'package:pregnancy_app/model/users.dart';
import 'package:pregnancy_app/screen/meal_detail_screen.dart';

class FoodRecommendation extends StatefulWidget{
  final Users user;
  FoodRecommendation(this.user);

  @override
  _FoodRecommendationState createState() => _FoodRecommendationState(user);
}

class _FoodRecommendationState extends State<FoodRecommendation>{
  final Users user;
  _FoodRecommendationState(this.user);
  CollectionReference meals = FirebaseFirestore.instance.collection('meal');

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recommended Food',
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
        )
      ),
      body: StreamBuilder(
        stream: meals.snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text("Something is wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Text("Loading");
          }
          return ListView.builder(
            itemCount: snapshot.data?.size,
            itemBuilder: (context, index) {
              List<String> items = [];
              if (snapshot.data?.docs[index]['Diet'] != null) {
                String? array = snapshot.data?.docs[index]['Diet'].toString();
                List<String>? dietType = array?.split(" ");

                int counter = 0;
                for (var data in dietType!) {
                  items.add(data);
                  counter++;
                  if (counter == 5) break;
                }
              }

              return InkWell(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(top: 12, bottom: 4, left: 4, right: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: pink),
                    color: Colors.white
                  ),
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.03),
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
                              fontWeight: FontWeight.bold
                            )),
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
                                      borderRadius: BorderRadius.circular(8.0),
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
                              if (snapshot.data?.docs[index]['catagory'] != null) IntrinsicWidth(
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      snapshot.data?.docs[index]['catagory'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              if(snapshot.data?.docs[index]['Veg_Non']=='veg')...[
                                IntrinsicWidth(
                                  child: Container(
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8.0),
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
                              ] else ... [
                                IntrinsicWidth(
                                  child: Container(
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(8.0),
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
                  Meal meal = Meal(category: snapshot.data?.docs[index]['catagory'], 
                      description: snapshot.data?.docs[index]['description'], 
                      diet: snapshot.data?.docs[index]['Diet'], 
                      disease: snapshot.data?.docs[index]['Disease'], 
                      meal_id: snapshot.data?.docs[index]['Meal_Id'], 
                      name: snapshot.data?.docs[index]['Name'], 
                      nutrient: snapshot.data?.docs[index]['Nutrient'], 
                      price: snapshot.data!.docs[index]['Price'].toString(), 
                      veg_non: snapshot.data?.docs[index]['Veg_Non']);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MealDetailScreen(meal)),
                  );
                },
              );
            },
          );
        },
      )
    );
  }
}