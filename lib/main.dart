import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';
import 'package:recre_mario_bros_flutter/constants/sprite_sheets.dart';
// import 'package:recre_mario_bros_flutter/games/super_mario_bros.dart';
import 'package:recre_mario_bros_flutter/games/super_mario_bros_game.dart';

// SuperMarioBrosGame _superMarioBrosGame = SuperMarioBrosGame();
final SuperMarioBrosGames _superMarioBrosGames = SuperMarioBrosGames();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-load sprite sheets.
  await SpriteSheets.load();

  await FlameAudio.audioCache.loadAll(
    [
      Globals.jumpSmallSFX,
      Globals.pauseSFX,
      Globals.bumpSFX,
      Globals.powerUpAppearsSFX,
      Globals.breakBlockSFX,
    ],
  );

  // runApp(
  //   MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: GameWidget(game: _superMarioBrosGame),
  //   ),
  // );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(
        game: _superMarioBrosGames,
      ),
    ),
  );
}
