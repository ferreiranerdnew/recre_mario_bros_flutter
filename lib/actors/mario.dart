/**
 * Classe responsavel pro criar todas as animações do super mario 
 * 
 */
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/gestures.dart';
import 'package:recre_mario_bros_flutter/constants/animation_configs.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';

enum MarioAnimationsState_RF {
  idle,
  walking,
  jumping,
}

class Mario extends SpriteAnimationGroupComponent<MarioAnimationsState_RF> {
  //RF Gravidade, criando uam variavel para a gravidade
  /**
   * No Eixo y a cada ponto que s ecai e adicionado um valor
   * Inicio variaveis sorbe gravidade
   */
  final double _gravity = 15;
  final Vector2 velocity = Vector2.zero();
  late Vector2 _minClamp;
  late Vector2 _maxClamp;
  // fim variaveis sorbe gravidade

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
    /**Sobre Gravidade bloco abaixo */
    _minClamp = levelBounds.topLeft +(size / 2);
    _maxClamp = levelBounds.bottomRight +(size / 2);

    add(CircleHitbox());
  }
  /**Os metodos são acionados a cada 0,01 segundo */
  @override
  void update(double dt){
    super.update(dt);

    if(dt>0.05) return;

    // BUG iniciar as duas funçõe sabaixo de gravidade
    velocityUpdate();
    positionUpdate(dt);
  }

  void velocityUpdate(){
    velocity.y += _gravity;
  }

  void positionUpdate(double dt){
    Vector2 distance = velocity * dt;
    position += distance;
    position.clamp(_minClamp,_maxClamp);

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
