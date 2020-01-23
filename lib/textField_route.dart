import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFieldRouteState();
  }
}

class TextFieldRouteState extends State<TextFieldRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFields"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Container(
                color: Colors.lime[200],
                child: TextField(decoration: InputDecoration(
                  fillColor: Colors.lime[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                  labelText: "password"
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
