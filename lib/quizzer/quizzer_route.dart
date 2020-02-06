import 'package:flutter/material.dart';

class QuizzerRoute extends StatefulWidget {
  @override
  _QuizzerRouteState createState() => _QuizzerRouteState();
}

class _QuizzerRouteState extends State<QuizzerRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Quiz Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text("HEJ"),
            ),
          ),
          _MyButton(
            color: Colors.green[600],
            text: "True",
            padding: 20.0,
            onPressed: () {},
          ),
          _MyButton(
            color: Colors.red[600],
            text: "False",
            padding: 20.0,
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: createRowChildren(),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  List<Icon> createRowChildren() {
    List<Icon> icons = List();
    for (int i = 0; i < 10; i += 1) {
      icons.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    }
    return icons;
  }
}

class _MyButton extends StatelessWidget {
  _MyButton({this.color, this.padding, this.text, this.onPressed});

  Color color;
  double padding;
  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: FlatButton(
        color: color,
        onPressed: () => onPressed,
        child: Container(
          height: 100,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
