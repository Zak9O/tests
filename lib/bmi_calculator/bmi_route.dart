import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests/bmi_calculator/button_changed_widget.dart';
import 'package:tests/bmi_calculator/reusable_card.dart';
import 'bmi_constants.dart';
import 'icon_content.dart';

//Enum used for identifying which icon where pressed
enum Gender { male, female }

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
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
          title: Text("BMI Calculator"),
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
                          ? kReusableCardActiveColor
                          : kReusableCardInactiveColor,
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
                          ? kReusableCardActiveColor
                          : kReusableCardInactiveColor,
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
                color: kReusableCardActiveColor,
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
                      color: kReusableCardActiveColor,
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
                      color: kReusableCardActiveColor,
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
            Container(
              color: kPinkColor,
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: kBottomContainerTopMargin),
              child: Center(
                child: Text(
                  "CALCULATE MY BMI",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    wordSpacing: 10.0,
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
