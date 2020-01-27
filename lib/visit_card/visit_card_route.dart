import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.teal[800],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/me.jpg'),
          ),
          Text(
            "Casper Koch",
            style: TextStyle(
                fontFamily: 'PermanentMarker',
                fontSize: 40.0,
                color: Colors.white),
          ),
          Text(
            "Flutter Developer",
            style: TextStyle(
              fontFamily: 'SourceSansLight',
              fontSize: 20.0,
              color: Colors.teal[100],
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            color: Colors.teal[200],
            width: 300.0,
            height: 1.0,
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 125.0),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.teal[900],
                ),
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  "+45 23 90 82 58",
                  style: TextStyle(
                      fontFamily: "SourceSansLight",
                      fontSize: 20.0,
                      color: Colors.teal[900]),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 125.0),
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.teal[900],
                ),
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  "kochcasper@gmail.com",
                  style: TextStyle(
                      fontFamily: "SourceSansLight",
                      fontSize: 20.0,
                      color: Colors.teal[900]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
