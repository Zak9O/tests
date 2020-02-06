import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

const List<Color> myColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.purple
];

class AudioPlayerRoute extends StatelessWidget {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Audio Player"),
        backgroundColor: Colors.black,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: myColors.map((color) {
            return Expanded(
              child: FlatButton(
                color: color,
                child: Center(child: Container()),
                onPressed: () {
                  playSound(myColors.indexOf(color) +
                      1); //indexOf + 1 is used to get the corresponding tone for the button
                },
              ),
            );
          }).toList()),
    );
  }

  void playSound(int num) {
    print("Playing tone$num.wav");
    final AudioCache player = AudioCache(prefix: 'tones/');
    player.play('note$num.wav');
  }
}
