import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTile extends StatelessWidget {
  MainTile(this.color, this.title, this.route, this.context);

  final Color color;
  final String title;
  final route;
  final context;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: FlatButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => route));
        },
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
