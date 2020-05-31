import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'dart:math';

import 'package:hope/my_flutter_app_icons.dart';

void main() => runApp(Hope());

class Hope extends StatefulWidget {
  @override
  _HopeState createState() => _HopeState();
}

class _HopeState extends State<Hope> {
  int _currentIndex = 0;

  List<Color> StarWarsColors = [
    Color(0xffff5252),
    Color(0xff8bc34a),
    Color(0xff03a9f4),
    Color(0xfff44336),
    Color(0xffffd740),
    Color(0xff3f51b5),
    Color(0xffcddc39),
    Color(0xff448aff),
    Color(0xffb2ff59),
    Color(0xffffc107),
  ];

  List<Color> PokemonColors = [
    Color(0xff474A2C),
    Color(0xff636940),
    Color(0xff59A96A),
    Color(0xff9BDEAC),
    Color(0xffB4E7CE),
    Color(0xff0F5257),
    Color(0xff0B3142),
    Color(0xff9C92A3),
    Color(0xffC6B9CD),
    Color(0xffD6D3F0),
  ];

  List<Color> MarioColors = [
    Color(0xff88D18A),
    Color(0xffCCDDB7),
    Color(0xff6A5B6E),
    Color(0xffF0B7B3),
    Color(0xffA833B9),
    Color(0xff686868),
    Color(0xffC2AFF0),
    Color(0xff9191E9),
    Color(0xff457EAC),
    Color(0xff2D5D7B),
  ];

  List shuffle(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {

      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  void teclaSound(String file, int nota) {
    final audioPlayer = AudioCache();
    audioPlayer.play('$file/sound$nota.mp3');
  }

  Expanded creaTecla({Color color, int nota, String file}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          teclaSound(file, nota);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final actions = [
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            creaTecla(color: StarWarsColors[0], nota: 1, file: "starwars"),
            creaTecla(color: StarWarsColors[1], nota: 2, file: "starwars"),
            creaTecla(color: StarWarsColors[2], nota: 3, file: "starwars"),
            creaTecla(color: StarWarsColors[3], nota: 4, file: "starwars"),
            creaTecla(color: StarWarsColors[4], nota: 5, file: "starwars"),
            creaTecla(color: StarWarsColors[5], nota: 6, file: "starwars"),
            creaTecla(color: StarWarsColors[6], nota: 7, file: "starwars"),
            creaTecla(color: StarWarsColors[7], nota: 8, file: "starwars"),
            creaTecla(color: StarWarsColors[8], nota: 9, file: "starwars"),
            creaTecla(color: StarWarsColors[9], nota: 10, file: "starwars"),
          ]),
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            creaTecla(color: PokemonColors[0], nota: 1, file: "pokemon"),
            creaTecla(color: PokemonColors[1], nota: 2, file: "pokemon"),
            creaTecla(color: PokemonColors[2], nota: 3, file: "pokemon"),
            creaTecla(color: PokemonColors[3], nota: 4, file: "pokemon"),
            creaTecla(color: PokemonColors[4], nota: 5, file: "pokemon"),
            creaTecla(color: PokemonColors[5], nota: 6, file: "pokemon"),
            creaTecla(color: PokemonColors[6], nota: 7, file: "pokemon"),
            creaTecla(color: PokemonColors[7], nota: 8, file: "pokemon"),
            creaTecla(color: PokemonColors[8], nota: 9, file: "pokemon"),
            creaTecla(color: PokemonColors[9], nota: 10, file: "pokemon"),
          ]),
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            creaTecla(color: MarioColors[0], nota: 1, file: "mario"),
            creaTecla(color: MarioColors[1], nota: 2, file: "mario"),
            creaTecla(color: MarioColors[2], nota: 3, file: "mario"),
            creaTecla(color: MarioColors[3], nota: 4, file: "mario"),
            creaTecla(color: MarioColors[4], nota: 5, file: "mario"),
            creaTecla(color: MarioColors[5], nota: 6, file: "mario"),
            creaTecla(color: MarioColors[6], nota: 7, file: "mario"),
            creaTecla(color: MarioColors[7], nota: 8, file: "mario"),
            creaTecla(color: MarioColors[8], nota: 9, file: "mario"),
            creaTecla(color: MarioColors[9], nota: 10, file: "mario"),
          ]),
    ];

    return MaterialApp(
      title: 'X',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: actions[_currentIndex],
        floatingActionButton: FabCircularMenu(
          ringColor: Colors.white,
          ringDiameter: 350,
          children: <Widget>[
            RawMaterialButton(
              onPressed: () => setState(() {
                _currentIndex = 0;
                shuffle(StarWarsColors);
              }),
              fillColor: Color(0xff1dcad3),
              shape: CircleBorder(),
              child: Icon(
                MyFlutterApp.icons8_darth_vader,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () => setState(() {
                _currentIndex = 1;
                shuffle(PokemonColors);
              }),
              fillColor: Color(0xff1dcad3),
              shape: CircleBorder(),
              child: Icon(
                MyFlutterApp.pokemon,
                color: Colors.white,
              ),
            ),
            RawMaterialButton(
              onPressed: () => setState(() {
                _currentIndex = 2;
                shuffle(MarioColors);
              }),
              fillColor: Color(0xff1dcad3),
              shape: CircleBorder(),
              child: Icon(
                MyFlutterApp.icons8_super_mario,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
