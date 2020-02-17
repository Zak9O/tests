
import 'package:flutter/material.dart';
import 'package:tests/destini/destini_brain.dart';

class DestiniRoute extends StatefulWidget {
  @override
  _DestiniRouteState createState() => _DestiniRouteState();
}

class _DestiniRouteState extends State<DestiniRoute> {
  DestiniBrain destiniBrain = DestiniBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destini"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  destiniBrain.getStoryTitle(),
                  style: TextStyle(color: Colors.white, fontSize: 26.0),
                ),
              ),
            ),

            ///Choice 1
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    destiniBrain.submitAnswer(1);
                  });
                },
                child: Text(
                  destiniBrain.getChoice1(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
                padding: EdgeInsets.all(20.0),
              ),
            ),

            ///Choice 2
            Visibility(
              visible: destiniBrain.showChoice2, //If true show the question
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    destiniBrain.submitAnswer(2);
                  });
                },
                child: Text(
                  destiniBrain.getChoice2(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue[600],
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
