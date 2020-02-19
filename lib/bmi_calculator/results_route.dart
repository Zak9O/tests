import 'package:flutter/material.dart';
import 'package:tests/bmi_calculator/bmi_constants.dart';
import 'package:tests/bmi_calculator/widgets/reusable_card.dart';

class ResultsRoute extends StatelessWidget {
  final String bodyState;
  final String bmi;
  final String interpretation;

  ResultsRoute({this.bodyState, this.bmi, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "Your Results",
                  style: kBigTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            bodyState.toUpperCase(),
                            style: TextStyle(
                                color: 18.5 <= double.parse(bmi) &&
                                        double.parse(bmi) <= 25.0
                                    ? kNormalBMIColor
                                    : kInormalBMIColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          Text(
                            bmi,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Normal BMI range:",
                            style: kResultsGreyTextStyle,
                          ),
                          Text(
                            "18,5 - 25 kg/m2",
                            style: kResultsWhiteTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      interpretation,
                      style: kResultsWhiteTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            ///The pink bottomContainer
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: kBottomContainerHeight,
                color: kPinkColor,
                child: Center(
                  child: Text(
                    "RE-CALCULATE YOUR BMI",
                    style: kResultsWhiteTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
