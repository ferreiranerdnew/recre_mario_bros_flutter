import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';

class SuperMarioBrosGame extends FlameGame {
  // RF Criando as variaveis todos os componetes destas variaveis abaixo estão no (package:flame/camera.dart)
  late CameraComponent cameraComponent;
  final World world = World();

  @override
  Future<void> onLoad() async {
    // RF importando o lavel mapa 1  (recre_mario_bros_flutter/constants/globals.dart)
    TiledComponent map_1 = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize),
    );
    world.add(map_1);
    cameraComponent = CameraComponent(world: world)
    // RF Criar componente de cameras
    /* visor controla qual parte do mundo esta sendo vista através da janela de visualização 
    a janela de visualização é essencialmente uma janela a partir da qual o jogo é observado
    */
    ..viewfinder.visibleGameSize = Vector2(450, 50)




    return super.onLoad();
  }
}
