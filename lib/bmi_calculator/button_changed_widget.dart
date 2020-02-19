import 'package:flutter/material.dart';
import 'package:tests/bmi_calculator/round_icon_buton.dart';

import 'bmi_constants.dart';

class ButtonChangedWidget extends StatelessWidget {
  final Function button1Pressed;
  final Function button2Pressed;
  final IconData button1Icon;
  final IconData button2Icon;
  final Color buttonColor;

  final String labelText;
  final String mainText;

  ButtonChangedWidget(
      {this.button1Pressed,
      this.button2Pressed,
      this.button1Icon,
      this.button2Icon,
      this.buttonColor,
      this.labelText,
      this.mainText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          labelText,
          style: kSmallTextStyle,
        ),
        Text(
          mainText,
          style: kBigTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              color: buttonColor,
              icon: button1Icon,
              onPressed: button1Pressed,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              color: buttonColor,
              icon: button2Icon,
              onPressed: button2Pressed,
            ),
          ],
        )
      ],
    );
  }
}
