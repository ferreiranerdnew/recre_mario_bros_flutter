// import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';
import 'package:flame/components.dart';

class SuperMarioBrosGame extends FlameGame {
  // RF Criando as variaveis todos os componetes destas variaveis abaixo estão no (package:flame/camera.dart)
  late CameraComponent cameraComponent_RF;
  final World world_RF = World();

  @override
  Future<void> onLoad() async {
    // RF importando o lavel mapa 1  (recre_mario_bros_flutter/constants/globals.dart)
    TiledComponent map_RF = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );
    add(map_RF);
    // cameraComponent_RF = CameraComponent(world: world_RF)
    //   // RF Criar componente de cameras
    //   /* visor controla qual parte do mundo esta sendo vista através da janela de visualização
    //   a janela de visualização é essencialmente uma janela a partir da qual o jogo é observado
    //   */
    //   ..viewfinder.visibleGameSize = Vector2(50, 50)
    //   ..viewfinder.position = Vector2(0, 0)
    //   ..viewfinder.anchor = Anchor.topLeft
    //   ..viewport.position = Vector2(500, 0);

    //   // ..viewport.size = Vector2(100, 50)  

    // addAll([world_RF]);

    return super.onLoad();
  }
}
