import 'package:bmicalculator/Bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GenderCard.dart';
import 'ReusableCard.dart';
import 'package:bmicalculator/Settings.dart';
import 'package:bmicalculator/ResultsWindow.dart';

enum Gender {
  male,
  female,
}

class MainWindow extends StatefulWidget {
  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  Gender selected;
  Color maleColor = cardColor;
  Color femaleColor = cardColor;
  int heightInCentimeters = 170;
  double weightinkilos = 70;
  int age = 20;


  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      selected = gender;
      maleColor = activeCardColor;
      femaleColor = cardColor;
    } else {
      selected = gender;
      femaleColor = activeCardColor;
      maleColor = cardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        color: maleColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GenderCard(
                              sex: 'Male',
                              icon: FontAwesomeIcons.mars,
                              size: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        color: femaleColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GenderCard(
                              sex: 'Female',
                              icon: FontAwesomeIcons.venus,
                              size: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Height', style: textStyle),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Text(
                          heightInCentimeters.toString(),
                          style: numberStyle,
                        ),
                        Text('cm'),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape( enabledThumbRadius: 6),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
                          activeTrackColor: accent,
                          inactiveTrackColor: accent2,
                          thumbColor: Colors.red,
                        ),
                        child: Slider(
                          min: 120,
                          max: 220,
                          value: heightInCentimeters.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              heightInCentimeters = newValue.round();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new ReusableCard(
                      color: cardColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(weightinkilos.toString(),
                                    style: numberStyle,),
                              Text('kg' )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: (){
                            setState(() {
                              weightinkilos-=0.5;
                            });
                          }, child: Icon(FontAwesomeIcons.minus),
                            backgroundColor: accent,),
                              SizedBox(width: 20,),
                              FloatingActionButton(
                                heroTag: "btn2",
                                onPressed: (){
                                setState(() {
                                  weightinkilos+=0.5;
                                });
                              }, child: Icon(FontAwesomeIcons.plus),
                              backgroundColor: accent,),
                          ],
                          ),
                        ],
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: new ReusableCard(
                      color: cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(age.toString(),
                                style: numberStyle,),
                              Text('age' )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: "btn3",
                                onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }, child: Icon(FontAwesomeIcons.minus),
                                backgroundColor: accent,),
                              SizedBox(width: 20,),
                              FloatingActionButton(
                                heroTag: "btn4",
                                onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }, child: Icon(FontAwesomeIcons.plus),
                              backgroundColor: accent,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              child: FlatButton(
                onPressed: () {
                  Bmi bmi = Bmi(weight: weightinkilos, height: heightInCentimeters);
                  Navigator.push(context, MaterialPageRoute( builder: (context)=>ResultsWindow(
                   bmiResult: bmi.getBmi(),
                    interpretation: bmi.getInterpretation(),
                    resultText: bmi.getText(),
                  ),
                  ),
                  );
                },
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                color: accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
