import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests/bmi_calculator/bmi_brain.dart';
import 'package:tests/bmi_calculator/widgets/button_changed_widget.dart';
import 'package:tests/bmi_calculator/results_route.dart';
import 'package:tests/bmi_calculator/widgets/reusable_card.dart';
import 'bmi_constants.dart';
import 'widgets/icon_content.dart';

//Enum used for identifying which icon where pressed
enum Gender { male, female }

class BmiRoute extends StatefulWidget {
  @override
  _BmiRouteState createState() => _BmiRouteState();
}

class _BmiRouteState extends State<BmiRoute> {
  Gender selectedGender;
  int heightValue = 180;
  int weightValue = 60;
  int ageValue = 18;

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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kSmallTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          heightValue.toString(),
                          style: kBigTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kSmallTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kGreyColor,
                          thumbColor: kPinkColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color(0x1fEB1555)),
                      child: Slider(
                        value: heightValue.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (value) {
                          setState(() {
                            heightValue = value.toInt();
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
                      color: kActiveColor,
                      child: ButtonChangedWidget(
                        button1Icon: FontAwesomeIcons.minus,
                        button1Pressed: () {
                          setState(() {
                            weightValue--;
                          });
                        },
                        button2Icon: FontAwesomeIcons.plus,
                        button2Pressed: () {
                          setState(() {
                            weightValue++;
                          });
                        },
                        buttonColor: kGreyColor,
                        labelText: "WEIGHT",
                        mainText: weightValue.toString(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveColor,
                      child: ButtonChangedWidget(
                        button1Icon: FontAwesomeIcons.minus,
                        button1Pressed: () {
                          setState(() {
                            ageValue--;
                          });
                        },
                        button2Icon: FontAwesomeIcons.plus,
                        button2Pressed: () {
                          setState(() {
                            ageValue++;
                          });
                        },
                        buttonColor: kGreyColor,
                        labelText: "AGE",
                        mainText: ageValue.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BMIBrain bmiBrain = BMIBrain(heightValue, weightValue);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultsRoute(
                    bmi: bmiBrain.calculateBMI(),
                    bodyState: bmiBrain.determineBodyState(),
                    interpretation: bmiBrain.createInterpretation(),
                  );
                }));
              },
              child: Container(
                color: kPinkColor,
                width: double.infinity,
                height: kBottomContainerHeight,
                margin: EdgeInsets.only(top: kBottomContainerTopMargin),
                padding: EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Text(
                    "CALCULATE",
                    textAlign: TextAlign.center,
                    style: kLargeButtonTextStyle,
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
