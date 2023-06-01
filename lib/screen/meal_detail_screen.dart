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
    );
  }
}