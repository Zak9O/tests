import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoute extends StatefulWidget {
  @override
  _DiceRouteState createState() => _DiceRouteState();
}

class _DiceRouteState extends State<DiceRoute> {
  int _leftDiceImage = Random().nextInt(6) + 1;
  int _rightDiceImage = Random().nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child:
                      Image.asset('assets/images/dice/dice$_leftDiceImage.png'),
                  onPressed: () {
                    _dicePressed();
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset(
                      'assets/images/dice/dice$_rightDiceImage.png'),
                  onPressed: () {
                    _dicePressed();
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void _dicePressed() => setState(() {
        _leftDiceImage = Random().nextInt(6) + 1;
        _rightDiceImage = Random().nextInt(6) + 1;
      });
}
