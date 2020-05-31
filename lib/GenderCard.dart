import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({@required this.sex, this.icon, this.size});
  final String sex;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Icon(
              icon,
              size: size,
            )
        ),
        SizedBox(height: 20,),

        Text(sex,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );

  }
}