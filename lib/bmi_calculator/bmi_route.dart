import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests/bmi_calculator/reusable_card.dart';

import 'icon_content.dart';

///[ReusableCard]properties
const Color reusableCardActiveColor = Color(0xFF1D1E33);
const Color reusableCardInactiveColor = Color(0xFF111328);

///IconCard

///BottomContainerProperties
const Color bottomContainerColor = Color(0xFFEB1555);
const double bottomContainerHeight = 80.0;
const double bottomContainerTopMargin = 10.0;

//Enum used for identifying which icon where pressed
enum Gender { male, female }

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        color: selectedGender == Gender.male
                            ? reusableCardActiveColor
                            : reusableCardInactiveColor,
                        child: IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: "MALE",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        color: selectedGender == Gender.female
                            ? reusableCardActiveColor
                            : reusableCardInactiveColor,
                        child: IconContent(
                          icon: FontAwesomeIcons.venus,
                          text: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: ReusableCard(color: reusableCardActiveColor)),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(color: reusableCardActiveColor)),
                  Expanded(child: ReusableCard(color: reusableCardActiveColor)),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: bottomContainerTopMargin),
            )
          ],
        ),
      ),
    );
  }
}
