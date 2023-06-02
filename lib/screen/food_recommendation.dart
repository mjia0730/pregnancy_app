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
            return Text("Something is wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading");
          }
          return ListView.builder(
            itemCount: snapshot.data?.size,
            itemBuilder: (context, index){
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: pink),
                    color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data?.docs[index]['Name'],
                          style: const TextStyle(
                            color: black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400
                          )),
                          if(snapshot.data?.docs[index]['Veg_Non']=='veg')...[
                            const Text('Veg',
                            style: TextStyle(
                              color: green,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400
                            )),
                          ] else ... [
                            const Text('Non-Veg',
                            style: TextStyle(
                              color: red,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400
                            )),
                          ]
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