import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/audio_player/audio_player_route.dart';
import 'package:tests/dice_game/dice_route.dart';
import 'package:tests/dropdown_route.dart';
import 'package:tests/layout/layout_route.dart';
import 'package:tests/magic_eightball/magic_eigthball_route.dart';
import 'package:tests/main_tile.dart';
import 'package:tests/navigationbar/navigation_bar_route.dart';
import 'package:tests/quizzer/quizzer_route.dart';
import 'package:tests/textField_route.dart';
import 'package:tests/visit_card/visit_card_route.dart';

void main() => runApp(MaterialApp(
      title: "Navigation Screen",
      home: StartRoute(),
    ));

///Holds the routes corresponding to the titles
final List routes = [
  DropdownRoute(Colors.blue[100]),
  TextFieldRoute(),
  NavigationBarRoute(),
  LayoutRoute(),
  VisitCardRoute(),
  DiceRoute(),
  MagicEightballRoute(),
  AudioPlayerRoute(),
  QuizzerRoute(),
];

///Holds the names coresponding to the routes
final List<String> titles = [
  "Dropdown",
  "Textfields and\ngetting userinput",
  "Navigationbar",
  "Layout",
  "Visit Card",
  "Dice Game",
  "Magic Eightball",
  "Audio Player",
  "Quiz Game"
];

class StartRoute extends StatelessWidget {
  List<MainTile> createChildren(BuildContext buildContext) {
    bool grow = true; //If set to false, the index will decrease
    int index = 0; //The respective color type of each tile

    return titles.map((title) {
      /*
      Checks if the index gets out of boundaries [100-900]
       */
      if (index == 900) {
        grow = false;
      } else if (index == 100) {
        grow = true;
      }

      if (grow) {
        index += 100;
      } else {
        index -= 100;
      }

      return MainTile(Colors.blue[index], title, routes[titles.indexOf(title)],
          buildContext, Key(title));
    }).toList();
  }

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
        children: createChildren(context),
      ),
    );
  }
}
