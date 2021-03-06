import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.child});
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(10),
      child: child,
    );

  }
}