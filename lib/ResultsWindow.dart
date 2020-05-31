import 'package:bmicalculator/MainWindow.dart';
import 'package:bmicalculator/main.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/Settings.dart';
import 'Bmi.dart';



class ResultsWindow extends StatelessWidget {

  String bmiResult;
  Text resultText;
  String interpretation;

  ResultsWindow({this.bmiResult,this.resultText,this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Your results'
                  , style: textStyle,),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                margin: EdgeInsets.all(10),

                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(10)
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Center(
                      child: resultText
                    ),

                    Text(bmiResult, style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),),
                    Text(interpretation , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                  ],
                ),

              ),
            ),
          Container(
            height: 80,
            width: double.infinity,
            child: FlatButton(
            color: accent,
              child: Text('Recalculate',
                style: TextStyle(color: Colors.black),),
              onPressed: (){
              Navigator.pop(context);

          }),),
          ],
        ),
      ),
    );
  }
}


