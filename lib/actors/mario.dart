/**
 * Classe responsavel pro criar todas as animações do super mario 
 * 
 */
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:recre_mario_bros_flutter/constants/animation_configs.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';

enum MarioAnimationsState_RF {
  idle,
  walking,
  jumping,
}

class Mario extends SpriteAnimationGroupComponent<MarioAnimationsState_RF> {
  Mario({required Vector2 position, required Rectangle levelBounds})
      : super(
          position: position,
          size: Vector2(
            Globals.tileSize,
            Globals.tileSize,
          ),
          anchor: Anchor.topLeft,
        ) {
    debugMode = true;
  }
  //RF especificar qual animação inicia o mario
  @override
  Future<void>? onLoad() async {
    //RF Acessar as configurações de animação
    final SpriteAnimation idle = await AnimationConfigs.mario.idle();
    //RF mapeando cada uma das animações

    animations = {
      MarioAnimationsState_RF.idle: idle,
    };

    current = MarioAnimationsState_RF.idle;

    return super.onLoad();
  }
}
