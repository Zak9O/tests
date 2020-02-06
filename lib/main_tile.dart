import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTile extends StatelessWidget {
  MainTile(this.color, this.title, this.route, this.context, this.Key);

  final Color color;
  final String title;
  final route;
  final context;
  final Key;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key,
      color: color,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
