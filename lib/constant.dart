import 'package:flutter/material.dart';

//Colour
const pink = Color(0xfff687b3);
const black = Color(0xff1e293b);
const yellow = Color(0xfffda402);

//UI design for text field where the user enter the email and password
const TextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0), borderRadius: BorderRadius.all(Radius.circular(32.0))),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0), borderRadius: BorderRadius.all(Radius.circular(32.0))),
);