/**
 * Classe responsavel pro criar todas as animações do super mario 
 * 
 */
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:recre_mario_bros_flutter/constants/animation_configs.dart';
import 'package:recre_mario_bros_flutter/constants/globals.dart';
import 'package:recre_mario_bros_flutter/objects/platform.dart';

enum MarioAnimationsState_RF {
  idle,
  walking,
  jumping,
}

class Mario extends SpriteAnimationGroupComponent<MarioAnimationsState_RF>
    with CollisionCallbacks, KeyboardHandler {
  //RF Gravidade, criando uma variavel para a gravidade
  /**
   * No Eixo y a cada ponto que s ecai e adicionado um valor
   * Inicio variaveis sorbe gravidade
   */
  final double _gravity = 15;
  final Vector2 velocity = Vector2.zero();
  late Vector2 _minClamp;
  late Vector2 _maxClamp;
  // fim variaveis sorbe gravidade
  double _jumpSpeed = 400;
  // determinando a velocidade que o mario deve andar na tela
  //variaveis referente a velocidade e o eixo que vamos deixar o mario virado
  static const double _minMoveSpeed = 125;
  static const double _maxMoveSpeed = _minMoveSpeed + 100;
  double _currentSpeed = _minMoveSpeed;  
  bool isFacingRight = true;
  int _hAxisInput = 0;



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
    _minClamp = levelBounds.topLeft + (size / 2);
    _maxClamp = levelBounds.bottomRight + (size / 2);

    add(CircleHitbox());
  }
  /**Os metodos são acionados a cada 0,01 segundo */
  @override
  void update(double dt) {
    super.update(dt);

    if (dt > 0.05) return;

    // BUG iniciar as duas funçõe sabaixo de gravidade
    velocityUpdate();
    positionUpdate(dt);
  }

  //BUG evento relaciodado a teclas 
  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed){

    _hAxisInput = 0;
    //se movendo com a tecla para esquerda
    _hAxisInput += keysPressed.contains(LogicalKeyboardKey.arrowLeft)? -1 : 0;
    _hAxisInput += keysPressed.contains(LogicalKeyboardKey.arrowLeft)? -1 : 0;
    
    return super.onKeyEvent(event, keysPressed);

  }



  void velocityUpdate() {
    velocity.y += _gravity;
    velocity.y = velocity.y.clamp(-_jumpSpeed, 150);

  }

  void positionUpdate(double dt) {
    Vector2 distance = velocity * dt;
    position += distance;
    position.clamp(_minClamp, _maxClamp);
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

  //BUG Necessario colocar esta funação abaixo para que o mario consigo colidir com a plataforma, caso não tenh fic aem queda livre
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    //vamos verificar se colidiu com a plataforma
    if (other is Platform) {
      if (intersectionPoints.length == 2) {
        platformPositionCheck_RF(intersectionPoints);
      }
    }
  }

  void platformPositionCheck_RF(Set<Vector2> intersectionPoints) {
    final Vector2 mid =
        (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) / 2;
        final Vector2 collisionNormal = absoluteCenter - mid;
        double penetrationLength = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        position += collisionNormal.scaled(penetrationLength);
  }
}
