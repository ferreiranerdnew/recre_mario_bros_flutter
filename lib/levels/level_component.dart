import 'dart:math';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flame/components.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';
import 'package:recre_mario_bros_flutter/games/super_mario_bros_game.dart';
import 'package:recre_mario_bros_flutter/levels/level_option.dart';

class LeveComponent extends Component with HasGameRef<SuperMarioBrosGame> {
  final LevelOption option;

  late Rectangle _levelBounds_RF;

  LeveComponent(this.option) : super();

  @override
  Future<void> onLoad() async {
    // RF importando o lavel mapa 1  (recre_mario_bros_flutter/constants/globals.dart)
    TiledComponent level_RF = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );

    gameRef.world_RF.add(level_RF);
    // RF definindo onde o mario ira iniciar no mundo
    _levelBounds_RF = Rectangle.fromPoints(
      Vector2(0, 0),
      Vector2(level_RF.tileMap.map.width.toDouble(),
              level_RF.tileMap.map.height.toDouble()) *
          Globals.tileSize,
    );

    return super.onLoad();
  }
}
