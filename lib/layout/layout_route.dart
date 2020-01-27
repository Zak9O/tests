import 'package:flutter/material.dart';

class LayoutRoute extends StatefulWidget {
  @override
  _LayoutRouteState createState() => _LayoutRouteState();
}

class _LayoutRouteState extends State<LayoutRoute> {
  IconData _myIcon = Icons.favorite_border;

  int _colorDepth = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Layout"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _myIcon,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                if (_myIcon == Icons.favorite_border) {
                  _myIcon = Icons.favorite;
                } else {
                  _myIcon = Icons.favorite_border;
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _makeRowChildren(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Colors.blue,
                  height: 60.0,
                  child: FlatButton(
                    child: Text("Press me"),
                    color: Colors.blue[_colorDepth],
                    splashColor: Colors.blue[_colorDepth + 100],
                    onPressed: () {
                      setState(() {
                        if (_colorDepth == 900) {
                          _colorDepth = 100;
                        } else {
                          _colorDepth += 100;
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: 100.0,
                  color: Colors.red,
                ),
                Container(
                  width: 100.0,
                  height: 200.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 100.0,
                        color: Colors.yellow.withOpacity(0.4),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100.0,
                  height: double.infinity,
                  color: Colors.blue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _makeRowChildren() {
    List<Container> containers = <Container>[];

    for (int i = 0; i < 3; i++) {
      containers.add(Container(
        margin: EdgeInsets.all(15.0),
        height: 100.0,
        width: 100.0,
        color: Colors.blue[_colorDepth],
        child: Center(
          child: Text("Noice"),
        ),
      ));
    }

    return containers;
  }
}
