import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/navigationbar/bottom_navigation_item.dart';

class NavigationBarRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationBarRouteState();
  }
}

class NavItem {
  NavItem(this.title, this.icon, this.isSelected);

  final String title;
  final IconData icon;
  bool isSelected;
}

class NavigationBarRouteState extends State<NavigationBarRoute> {
  final List<NavItem> navItems = [
    NavItem("Map", Icons.map, true),
    NavItem("Favorites", Icons.favorite, false)
  ];

  void _iconPressed(String title) {
    setState(() {
      print(title);

      for (NavItem navItem in navItems) {
        if (navItem.isSelected) {
          navItem.isSelected = false;
        }
        if (navItem.title == title) {
          navItem.isSelected = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 91,
        color: Colors.blue[100],
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomNavigationItem(
              navItems[0],
              onPressed: _iconPressed,
            ),
            BottomNavigationItem(
              navItems[1],
              onPressed: _iconPressed,
            )
          ],
        ),
      ),
    );
  }
}
