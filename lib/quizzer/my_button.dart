import 'package:flutter/material.dart';

///A custom button used in quizzer_route.dart
class MyButton extends StatelessWidget {
  MyButton({this.color, this.padding, this.text, this.onPressed()});

  final Color color;
  final double padding;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: FlatButton(
        color: color,
        onPressed: () => onPressed(),
        child: Container(
          height: 100,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
