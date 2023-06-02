import 'package:flutter/material.dart';
import 'package:pregnancy_app/constant.dart';
import 'package:pregnancy_app/model/meal.dart';

class MealDetailScreen extends StatefulWidget{
  final Meal meal;
  MealDetailScreen(this.meal);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState(meal);
}

class _MealDetailScreenState extends State<MealDetailScreen>{
  final Meal meal;
  _MealDetailScreenState(this.meal);

  List<String> diets = [];
  List<String> diseases = [];
  
  @override
  void initState() {
    super.initState();
    List<String>? dietType = meal.diet.split(" ");
    List<String>? diseaseType = meal.disease.split(" ");

    for (var data in dietType) {
      data = data.replaceAll("_", " ");
      diets.add(data);
    }

    for (var data in diseaseType) {
      data = data.replaceAll("_", " ");
      diseases.add(data);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.name,
        style: const TextStyle(
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Food: ${meal.name}',
                  style: const TextStyle(
                    color: black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Food type:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5),
              IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      meal.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Description:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  meal.description, 
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
              ),
              const SizedBox(height: 20),
              const Text(
                'Price:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'RM ${meal.price}', 
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
              ),
              const SizedBox(height: 20),
              const Text(
                'Type of diet:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: diets.map((item) {
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
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nutrient:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.purple[600],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      meal.nutrient,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Suitable for patient who diagnosed:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: diseases.map((item) {
                    return IntrinsicWidth(
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Others:',
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              if(meal.veg_non=='veg')...[
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
                          fontSize: 14.0,
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
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50)
              ]
            ],
          ),
        ),
      ),
    );
  }
}