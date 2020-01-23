import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> _imagePATHs = [
  "assets/images/hugo-bitcoin-mining.png",
  "assets/images/hugo-easy-money.png"
];

const List<String> _imageNames = ["Bitcoin Robot", "Rich Kid"];

class DropdownRoute extends StatefulWidget {
  Color color;

  @override
  State<StatefulWidget> createState() {
    return _DropdownRouteState(color);
  }

  DropdownRoute(Color color) {
    this.color = color;
  }
}

class _DropdownRouteState extends State<DropdownRoute> {
  //An integer which the class uses to get the proper imagePATH and imageName
  int _imagePosition = 0;
  Color color;

  _DropdownRouteState(color) {
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown"),
        backgroundColor: Colors.green[600],
      ),
      backgroundColor: Colors.green[400],
      body: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.green,
            child: Image(
              image: AssetImage(_imagePATHs[_imagePosition]),
            ),
          ),
          DropdownButton<String>(
              value: _imageNames[_imagePosition],
              icon: Icon(
                Icons.arrow_downward,
                color: Colors.green[800],
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.green[800]),
              underline: Container(
                height: 2,
                color: Colors.green[800],
              ),
              onChanged: (String newValue) {
                setState(() {
                  _imagePosition = _imageNames.indexOf(newValue);
                });
              },
              items: _populateMenuItems())
        ],
      ),
    );
  }

  _populateMenuItems() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (int i = 0; i < _imagePATHs.length; i++) {
      menuItems.add(DropdownMenuItem(
        value: _imageNames[i],
        child: Text(_imageNames[i]),
      ));
    }
    return menuItems;
  }
}
