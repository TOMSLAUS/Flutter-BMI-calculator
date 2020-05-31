import 'package:bmicalculator/MainWindow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BmiCalc());
}

class BmiCalc extends StatefulWidget {
  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainWindow(),
    );
  }
}

