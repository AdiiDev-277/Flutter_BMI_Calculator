import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({
    required this.color,
    this.cardChild,
  });

  final Color color;
  final cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      width: 170.0,
      height: 200.0,
    );
  }
}
