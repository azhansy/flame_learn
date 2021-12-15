//
// @author dashu
// @date 12/10/21
// describe:
//

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_learn/game/moonlander_game.dart';
import 'package:flutter/cupertino.dart';

// class PauseComponent extends SpriteComponent
//     with Tappable, HasGameRef<MoonlanderGame> {
//   /// Position to show the button.
//   PauseComponent({
//     required Vector2 position,
//     required Sprite sprite,
//   }) : super(position: position, size: Vector2(50, 25), sprite: sprite);
//
//   // @override
//   // bool get isHud => true;
//
//   @override
//   bool onTapDown(TapDownInfo info) {
//     debugPrint('PauseComponent -> onTapDown');
//     if (gameRef.overlays.isActive('pause')) {
//       gameRef.overlays.remove('pause');
//     } else {
//       gameRef.overlays.add('pause');
//     }
//
//     return super.onTapDown(info);
//   }
// }

class PauseComponent extends HudButtonComponent{
  ///Sprite and position of our button
  PauseComponent({
    required EdgeInsets margin,
    required Sprite sprite,
    required VoidCallback onPressed,
    Sprite? spritePressed,
  }) : super(
    button: SpriteComponent(
      position: Vector2.zero(),
      sprite: sprite,
      size: Vector2(250, 125),
    ),
    buttonDown: SpriteComponent(
      position: Vector2.zero(),
      sprite: spritePressed,
      size: Vector2(150, 125),
    ),
    margin: margin,
    onPressed: onPressed,
  );
}
