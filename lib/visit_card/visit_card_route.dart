import 'package:flutter/material.dart';

class VisitCardRoute extends StatefulWidget {
  @override
  _VisitCardRouteState createState() => _VisitCardRouteState();
}

class _VisitCardRouteState extends State<VisitCardRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Visit Card"),
      ),
      body: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.red,
            backgroundImage:
                AssetImage('assets\images\hugo-bitcoin-mining.png'),
          )
        ],
      ),
    );
  }
}
