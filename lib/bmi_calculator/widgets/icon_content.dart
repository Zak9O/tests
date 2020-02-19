import 'package:flutter/material.dart';
import '../bmi_constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  IconContent({this.icon, this.text, this.iconColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconContentSize,
          color: iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kSmallTextStyle,
        )
      ],
    );
  }
}

class IconContentFunctionality {
  bool isSelected;
  Color iconColor;

  IconContentFunctionality(this.isSelected, this.iconColor);

  //Returns true if color has changed
  bool changeColor(Color inactiveColor, Color activeColor,
      {bool colorChanged = false}) {
    if (!isSelected) {
      iconColor = activeColor;
      return true;
    }
    if (colorChanged) {
      iconColor = inactiveColor;
    }
    return false;
  }
}
