import 'package:flame/game.dart';
import 'package:flame_flare/flame_flare.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

//
// @author dashu
// @date 12/14/21
// describe:
//
//flare 容器
class FlareComponent extends FlareActorComponent {
  final FlareControls animationController;
  final String flrName;
  final double? s;
  final double? w;
  final double? h;

  FlareComponent(
    this.animationController,
    this.flrName, {
    this.s,
    this.w,
    this.h,
  })  : assert(s != null || (w != null && h != null)),
        super(
          FlareActorAnimation(
            'assets/flr/launch.flr',
            // 'assets/$flrName',
            // controller: animationController,
            fit: BoxFit.fill,
            alignment: Alignment.bottomCenter,
          ),
          size: s != null ? Vector2(s, s) : Vector2(w!, h!),
        );
}
