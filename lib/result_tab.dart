import 'package:bmi/input.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reusable_card.dart';

class ResultTab extends StatelessWidget {
ResultTab({required this.bmiResult, required this.resultText, required this.disText});
  final String bmiResult;
  final String resultText;
  final String disText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATE'),
      ),
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('YOUR RESULT...', style: ResultTextStyle))),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: ActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: ResultNormalStyle),
                  Text(bmiResult, style: ResultNumStyle),
                  Text(disText,
                      textAlign: TextAlign.center, style: ResultDisStyle),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Input()));
            },
            child: Container(
              child: Center(
                child: Text('RE-CALCULATE',style:TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
              color: BottamContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
