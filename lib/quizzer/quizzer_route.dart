import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tests/quizzer/quizzer_model.dart';

import 'my_button.dart';

class QuizzerRoute extends StatefulWidget {
  @override
  _QuizzerRouteState createState() => _QuizzerRouteState();
}

class _QuizzerRouteState extends State<QuizzerRoute> {
  QuizzerModel model = QuizzerModel();

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
              child: Text(
                model.questions[shownQuestion].text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MyButton(
            color: Colors.green[600],
            text: "True",
            padding: 20.0,
            onPressed: () {
              submitAnswer(true);
            },
          ),
          MyButton(
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
      //Checks if the answer is correct
      if (answer == model.questions[shownQuestion].answer) {
        //If answer is correct add the corresponding icon
        scoreTracker.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        //If answer is incorrect   add the corresponding icon
        scoreTracker.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      /*
      A safe function that prevents the app from crashing due to overstepping the index of Questions
       */
      if (shownQuestion == model.questions.length - 1) {
        shownQuestion = 1;
      } else {
        shownQuestion += 1;
      }
    });
  }
}
