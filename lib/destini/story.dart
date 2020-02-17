import 'package:flutter/cupertino.dart';

class Story {
  int storyID;
  String storyTitle;
  String choice1;
  String choice2;
  int choice1Destination;
  int choice2Destination;

  Story(
      {this.storyTitle,
      this.choice1,
      this.choice2,
      @required this.storyID,
      this.choice1Destination,
      this.choice2Destination});
}
