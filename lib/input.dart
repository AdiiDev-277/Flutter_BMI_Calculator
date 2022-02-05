
import 'package:bmi/result_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'calculate_brain.dart';
import 'result_tab.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  late Gender selectGender;
  int height = 180;
  int weight = 60;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(child: Text("BMI CALCULATER")),
      ),
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: ActiveColor,
                    cardChild: IconContent(
                      label: "MAlE",
                      icon: Icons.male,
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  color: ActiveColor,
                  cardChild: IconContent(
                    label: "FEMALE",
                    icon: Icons.female,
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: ActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: LabelColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: NumberTextStyle),
                      Text(
                        'CM',
                        style: LabelColor,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EC7296),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF111328),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
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
                  child: ReusableCard(
                    color: ActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: LabelColor,
                        ),
                        Text(
                          weight.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight
                                    --;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: ActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: LabelColor,
                        ),
                        Text(
                          age.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculaterBrain cal = CalculaterBrain(weight: weight, height: height);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultTab(
                bmiResult: cal.calculateMBI(),
                resultText: cal.getResult(),
                disText: cal.getDis(),
              )));
            },
            child: Container(
              child: Center(
                child: Text('CALCULATE',style:TextStyle(
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
