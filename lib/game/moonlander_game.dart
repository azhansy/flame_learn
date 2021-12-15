import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_learn/component/flare_component.dart';
import 'package:flame_learn/component/pause_component.dart';
import 'package:flame_learn/component/rocket_component.dart';
import 'package:flame_learn/controls/minion_controller.dart';
import 'package:flame_learn/ext/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//
// @author dashu
// @date 12/10/21
// describe:
// 居然真的可以看到
/*HasTappableComponents,*/
class MoonlanderGame extends FlameGame
    with HasCollidables, HasTappables, HasKeyboardHandlerComponents {

  MinionController minionController = MinionController();

  /// Depending on the active overlay state we turn of the engine or not.
  void onOverlayChanged() {
    debugPrint(
        'MoonlanderGame -> onOverlayChanged ${overlays.isActive('pause')}');
    if (overlays.isActive('pause')) {
      pauseEngine();
    } else {
      resumeEngine();
    }
  }

  @override
  bool get debugMode => kDebugMode;

  /// Restart the current level.
  void restart() {
    // TODO: Implement restart of current level.
    debugPrint('MoonlanderGame -> restart');
  }

  @override
  void onMount() {
    debugPrint('MoonlanderGame -> onMount');
    overlays.addListener(onOverlayChanged);
    super.onMount();
  }

  @override
  void onRemove() {
    debugPrint('MoonlanderGame -> onRemove');

    overlays.removeListener(onOverlayChanged);
    super.onRemove();
  }

  @override
  Future<void>? onLoad() async {
    final pausButton = await 'tab_pause_normal'.loadSprite();
    const stepTime = .3;
    final textureSize = Vector2(16, 24);
    const frameCount = 2;
    final idle = await 'tab_pause_normal'.loadSpriteAnimation(
      this,
      SpriteAnimationData.sequenced(
        amount: frameCount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
    final left = await 'tab_pause_normal'.loadSpriteAnimation(
      this,
      SpriteAnimationData.sequenced(
        amount: frameCount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
    final right = await 'tab_pause_normal'.loadSpriteAnimation(
      this,
      SpriteAnimationData.sequenced(
        amount: frameCount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
    final farRight = await 'tab_pause_normal'.loadSpriteAnimation(
      this,
      SpriteAnimationData.sequenced(
        amount: frameCount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
    final farLeft = await 'tab_pause_normal'.loadSpriteAnimation(
      this,
      SpriteAnimationData.sequenced(
        amount: frameCount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
    final rocketAnimation = {
      RocketState.idle: idle,
      RocketState.left: left,
      RocketState.right: right,
      RocketState.farLeft: farLeft,
      RocketState.farRight: farRight
    };

    add(FlareComponent(minionController, "flr/launch.flr",s: 500));


    await (add(
      RocketComponent(
        position: size / 2,
        size: Vector2(32, 48),
        animation: rocketAnimation,
      ),
    ));
    // await (add(PauseComponent(
    //     position: size / 3 /*Vector2(0, 0)*/, sprite: pausButton)));
    await add(PauseComponent(
      margin: const EdgeInsets.all(200),
      sprite: await 'tab_continue_pressed'.loadSprite(),
      spritePressed: await 'tab_pause_normal'.loadSprite(),
      onPressed: () {
        if (overlays.isActive('pause')) {
          overlays.remove('pause');
        } else {
          overlays.add('pause');
        }
      },
    )..size = Vector2(150, 125));
    //Only in debug mode, add 3s wait to simulate loading
    /*if (kDebugMode) {
      await Future<void>.delayed(const Duration(seconds: 3));
    }
    */
    overlays.addListener(onOverlayChanged);

    return super.onLoad();
  }
}
