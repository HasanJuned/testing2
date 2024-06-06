import 'package:flutter/material.dart';

final tealColor = Colors.teal[900];
final tealColor1 = Colors.teal[500];
const whiteColor = Colors.white;
const blackColor=Colors.black;

InputDecoration formStyle(String lable){
  return InputDecoration(
      fillColor: Colors.red,
      label: Text("${lable}"),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.teal,
        ),
      ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.blueAccent,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:const BorderSide(
        color: Colors.teal,
      ),
    ),
    );
}