// import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:recre_mario_bros_flutter/levels/level_component.dart';
import 'package:recre_mario_bros_flutter/levels/level_option.dart';

class SuperMarioBrosGame extends FlameGame {
  // RF Criando as variaveis todos os componetes destas variaveis abaixo estão no (package:flame/camera.dart)
  late CameraComponent cameraComponent_RF;
  final World world_RF = World();

  // RF importando os levels classe propria criada
  LevelComponent? _currentLevel_RF;

  @override
  Future<void> onLoad() async {
    cameraComponent_RF = CameraComponent(world: world_RF)
      // RF Criar componente de cameras
      /* visor controla qual parte do mundo esta sendo vista através da janela de visualização
      a janela de visualização é essencialmente uma janela a partir da qual o jogo é observado
      */
      // RF Posiciona o mundo no eixo vertical
      ..viewfinder.visibleGameSize = Vector2(450, 0)
      // RF Posiciona  o mundo no eixo vertical
      ..viewfinder.position = Vector2(110, 0)
      ..viewfinder.anchor = Anchor.topLeft
      ..viewport.position = Vector2(500, 0);

    //   // ..viewport.size = Vector2(100, 50)  

    addAll([world_RF, cameraComponent_RF]);

    loadLevel_RF(LevelOption.lv_1_1);

    return super.onLoad();
  }

  void loadLevel_RF(LevelOption option){
    _currentLevel_RF?.removeFromParent();
    _currentLevel_RF = LevelComponent(option);
    add(_currentLevel_RF!);

  }
}
