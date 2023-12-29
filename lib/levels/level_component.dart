import 'dart:math';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flame/components.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';
import 'package:recre_mario_bros_flutter/games/super_mario_bros_game.dart';
import 'package:recre_mario_bros_flutter/levels/level_option.dart';
import 'package:recre_mario_bros_flutter/objects/platform.dart';

class LevelComponent extends Component with HasGameRef<SuperMarioBrosGame> {
  final LevelOption option;

  late Rectangle _levelBounds_RF;

  LevelComponent(this.option) : super();

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
    // iniciando chamada da função createPlatforms
    createPlatforms(level_RF.tileMap);
    return super.onLoad();
  }
  //RF referenciando o objetc criado dentro do tile com noem de Platforms apos toda a configuração deve ficar com um controno rosa
  void createPlatforms(RenderableTiledMap tileMap) {
    ObjectGroup? platformsLayer = tileMap.getLayer<ObjectGroup>('Platforms');

    if (platformsLayer == null) {
      throw Exception(
          'inglês: Platforms Layer could not be found; português: A camada de plataformas não foi encontrada');
    }

    for (final TiledObject obj in platformsLayer.objects) {
      //esta Platform é uma classe nossa do nosso import package:recre_mario_bros_flutter/objects/platform.dart
      Platform platform = Platform(
        position: Vector2(obj.x, obj.y),
        size: Vector2(obj.width, obj.height),
      );
      gameRef.world_RF.add(platform);
    }
  }
}
