import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/navigationbar/navigation_bar_route.dart';

class BottomNavigationItem extends StatelessWidget {
  BottomNavigationItem(this.navItem, {this.onPressed(String title)}){
    if (navItem.isSelected){
      color = Colors.blue;
    } else{
      color = Colors.white;
    }
  }

  final NavItem navItem;
  final Function(String title) onPressed;
  Color color;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        onPressed(navItem.title);
      },
      child: Column(
        children: <Widget>[
          Icon(
            navItem.icon,
            color: color,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                navItem.title,
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: color,
                ),
              ))
        ],
      ),
    );
  }


}
