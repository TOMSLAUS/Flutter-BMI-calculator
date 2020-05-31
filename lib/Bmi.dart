import 'dart:math';

import 'package:bmicalculator/MainWindow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi{
 final int age;
 final int height;
 final double weight;
 final Gender gender;
 double _bmi;

  Bmi({this.age, this.height,this.gender,this.weight});

String getBmi(){
_bmi = weight/pow(height/100, 2);
return _bmi.toStringAsFixed(1);
 }

 Text getText(){
  if (_bmi>=25){
    return Text('Overweight' ,
      style: TextStyle(
        color: Colors.red , fontSize: 30,
        fontWeight: FontWeight.bold), );
  }
  else if(_bmi > 18.5) {
    return Text('Normal' ,
      style: TextStyle(
          color: Colors.red , fontSize: 30,
          fontWeight: FontWeight.bold), );
  }
    else {
 return Text('Underweight' ,
 style: TextStyle(
 color: Colors.red , fontSize: 30,
 fontWeight: FontWeight.bold), );
 }
  }


 String getInterpretation(){
   if (_bmi>=25){
     return 'You are overweight, you should excersise more!';
   }
   else if(_bmi > 18.5) {
     return 'Your body weight is normal!';
   }
   else {
     return 'You are underweight, you should eat more!';
   }
 }
}