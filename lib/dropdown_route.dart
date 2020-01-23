import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> _imagePATHs = [
  "assets/images/europe.png",
  "assets/images/milkyway.png"];

const List<String> _imageNames = [
  "Europe by night",
  "The milkyway"
];

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

  _DropdownRouteState(color){
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown"),
      ),
      body: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Text(
                "Pictures",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          Container(
            height: 300,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_imagePATHs[_imagePosition]),
                fit: BoxFit.fill
              )
            ),
          ),
          DropdownButton<String>(
            value: _imageNames[_imagePosition],
            icon: Icon(Icons.arrow_downward, color: Colors.black,),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Colors.black
            ),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (String newValue){
              setState(() {
                _imagePosition = _imageNames.indexOf(newValue);
              });
            },
            items: _populateMenuItems()
          )
        ],
      ),
    );
  }

  _populateMenuItems(){
    List<DropdownMenuItem<String>> menuItems = [];
    for(int i = 0; i < _imagePATHs.length; i++){
      menuItems.add(DropdownMenuItem(
        value: _imageNames[i],
        child: Text(_imageNames[i]),
      ));
    }
    return menuItems;
  }
}
