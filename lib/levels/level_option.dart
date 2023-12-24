import 'package:recre_mario_bros_flutter/constants/globals.dart';

enum LevelOption {
  lv_1_1(Globals.lv_1_1, '1-1');

  const LevelOption(this.patName, this.name);

  final String patName;
  final String name;
}
