import 'dart:math';

import 'package:flame/components.dart';
import 'package:recre_mario_bros_flutter/games/super_mario_bros_game.dart';
import 'package:recre_mario_bros_flutter/levels/level_option.dart';

class LeveComponent extends Component with HasGameRef<SuperMarioBrosGame> {
  final LevelOption option;

  late Rectangle _lavelBounds;

  LeveComponent(this.option) : super();

  @override
  Future<void> onLoad() async {
    return super.onLoad();
  }
}
