import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';

class SuperMarioBrosGames extends FlameGame {
  @override
  Future<void> onLoad() async {
    // RF importando o lavel mapa 1  (recre_mario_bros_flutter/constants/globals.dart)
    TiledComponent map_1 = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );
    add(map_1);
    return super.onLoad();
  }
}
