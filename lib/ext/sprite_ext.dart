import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

extension SpriteExt on String {
  //加载小精灵
  Future<Sprite> loadSprite({String format = 'png'}) async {
    return Sprite.load('$this.$format');
  }

  //加载小精灵动画
  Future<SpriteAnimation> loadSpriteAnimation(
    Game game,
    SpriteAnimationData animationData, {
    String format = 'png',
  }) async {
    return game.loadSpriteAnimation(
      '$this.$format',
      animationData,
    );
  }
}
