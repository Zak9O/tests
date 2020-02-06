import 'dart:ui';

import 'package:flutter/material.dart';

class QuizzerRoute extends StatefulWidget {
  @override
  _QuizzerRouteState createState() => _QuizzerRouteState();
}

const questions = {
  "q1": {
    "text": 'You can lead a cow down stairs but not up stairs.',
    "answer": false
  },
  "q2": {
    "text": 'Approximately one quarter of human bones are in the feet.',
    "answer": true
  },
  "q3": {"text": 'A slug\'s blood is green.', "answer": true}
};

class _QuizzerRouteState extends State<QuizzerRoute> {
  int shownQuestion = 1; //The questions which is displayed on screem

  List<Icon> scoreTracker =
      List(); //The list which contains the score with the help of icons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Quizzer"),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Text(
                  questions["q$shownQuestion"]["text"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          _MyButton(
            color: Colors.green[600],
            text: "True",
            padding: 20.0,
            onPressed: () {
              submitAnswer(true);
            },
          ),
          _MyButton(
            color: Colors.red[600],
            text: "False",
            padding: 20.0,
            onPressed: () {
              submitAnswer(false);
            },
          ),
          Container(
            //this container ensures that the size of the row is consistent
            height: 24.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: scoreTracker,
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  //TODO: Create a popup message that informs the user if they answered correctly
  void submitAnswer(bool answer) {
    setState(() {
      if (answer == questions["q$shownQuestion"]["answer"]) {
        //Checks if the answer is correct
        scoreTracker.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreTracker.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      /*
      A safe function that prevents the app from crashing due to overstepping the index of Questions
       */
      if (shownQuestion == questions.length) {
        shownQuestion = 1;
      } else {
        shownQuestion += 1;
      }
    });
  }
}

/*
A custom widget representing the buttons
 */

class _MyButton extends StatelessWidget {
  _MyButton({this.color, this.padding, this.text, this.onPressed()});

  final Color color;
  final double padding;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: FlatButton(
        color: color,
        onPressed: () => onPressed(),
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
