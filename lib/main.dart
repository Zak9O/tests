import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/dropdown_route.dart';
import 'package:tests/main_tile.dart';
import 'package:tests/navigationbar/navigation_bar_route.dart';
import 'package:tests/textField_route.dart';

void main() => runApp(MaterialApp(
      title: "Navigation Screen",
      home: StartRoute(),
    ));

class StartRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Screen"),
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        primary: false,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        crossAxisCount: 2,
        children: <Widget>[
          MainTile(Colors.blue[100], "Dropdown",
              DropdownRoute(Colors.blue[100]), context),
          MainTile(Colors.blue[200], "Textfields and\ngetting userinput",
              TextFieldRoute(), context),
          MainTile(Colors.blue[300], "Navigationbar", NavigationBarRoute(), context)
        ],
      ),
    );
  }
}
