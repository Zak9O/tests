import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/audio_player/audio_player_route.dart';
import 'package:tests/dice_game/dice_route.dart';
import 'package:tests/drop_down/dropdown_route.dart';
import 'package:tests/layout/layout_route.dart';
import 'package:tests/magic_eightball/magic_eigthball_route.dart';
import 'package:tests/main_tile.dart';
import 'package:tests/navigationbar/navigation_bar_route.dart';
import 'package:tests/quizzer/quizzer_route.dart';
import 'package:tests/text_field/textField_route.dart';
import 'package:tests/tile.dart';
import 'package:tests/visit_card/visit_card_route.dart';

void main() => runApp(MaterialApp(
      title: "Navigation Screen",
      home: StartRoute(),
    ));

///Holds the routes corresponding to the titles
final List<Tile> tiles = [
  Tile("Dropwdown", DropdownRoute(Colors.blue[100])),
  Tile("Textfields and\ngetting userinput", TextFieldRoute()),
  Tile("Navigationbar", NavigationBarRoute()),
  Tile("Layout", LayoutRoute()),
  Tile("Visit Card", VisitCardRoute()),
  Tile("Dice Game", DiceRoute()),
  Tile("Magiv Eightball", MagicEightballRoute()),
  Tile("Audio Player", AudioPlayerRoute()),
  Tile("Quiz Game", QuizzerRoute()),
];

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
        children: createChildren(context),
      ),
    );
  }

  List<MainTile> createChildren(BuildContext buildContext) {
    bool grow = true; //If set to false, the index will decrease
    int index = 0; //The respective color type of each tile

    return tiles.map((tile) {
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

      return MainTile(Colors.blue[index], tile.text, tile.route, buildContext,
          Key(tile.text));
    }).toList();
  }
}
