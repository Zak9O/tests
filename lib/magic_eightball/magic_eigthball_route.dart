import 'dart:math';

import 'package:flutter/material.dart';

class MagicEightballRoute extends StatefulWidget {
  @override
  _MagicEightballRouteState createState() => _MagicEightballRouteState();
}

const List<Color> myColors = [
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.green,
  Colors.greenAccent
];

const List<String> myColorsString = [
  "Blue",
  "Red",
  "Teal",
  "Green",
  "Green Accent"
];

class _MagicEightballRouteState extends State<MagicEightballRoute> {
  int _ballNumber = Random().nextInt(5) + 1;
  int index = Random().nextInt(myColors.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors[index],
      appBar: AppBar(
        title: Text("Magic Eightball"),
        backgroundColor: myColors[index].withOpacity(0.0),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.swap_horizontal_circle,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                index = Random().nextInt(myColors.length);
              });
            },
          ),
          PopupMenuButton(
            onSelected: (Color result) {
              setState(() {
                index = myColors.indexOf(result);
              });
            },
            itemBuilder: (BuildContext context) {
              return myColors.map((color) {
                return PopupMenuItem(
                  value: color,
                  child: Text(myColorsString[myColors.indexOf(color)]),
                  textStyle: TextStyle(color: color),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Center(
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Image(
            image: AssetImage('assets/images/eightball/ball$_ballNumber.png'),
          ),
          onPressed: () {
            setState(() {
              _ballNumber = Random().nextInt(5) + 1;
            });
          },
        ),
      ),
    );
  }
}
