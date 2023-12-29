/**
 * Classe responsavel pro criar todas as animações do super mario 
 * 
 */
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

enum MarioAnimationsState_RF{
  idle,
  walking,
  jumping,
}
class Mario extends SpriteAnimationGroupComponent<MarioAnimationsState_RF>{
  Mario({required Vector2 position, required Rectangle})
}
