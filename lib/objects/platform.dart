import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Platform extends PositionComponent {
  Platform({required Vector2 position, required Vector2 size})
      : super(position: position, size: size) {
        //Colocando o contorno rosa diante das plataformas
        debugMode = true;

      }
      @override
      Future<void>? onLoad() async{
        // BUG estudar sobr eos 3 tipos de colissoes que existem active ;passive ; inactive
        add(RectangleHitbox()..collisionType = CollisionType.passive);
        return super.onLoad();
      }
}
