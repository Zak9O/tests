import 'package:flutter/material.dart';

///Icon
const double iconSize = 80.0;

///SizedBox
const double sizedBoxHeight = 15.0;

///Text
const double textFontSize = 18.0;
const Color textColor = Color(0xFF8D8E98);

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
          size: iconSize,
          color: iconColor,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textFontSize, color: textColor),
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
