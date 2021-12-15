import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

///游戏flame的扩展
///音频播放
extension FlameExt on String {
  ///播放音频
  ///@ param longPlay means long audio files
  void play({bool longPlay = false, double volume = 1.0}) {
    if (longPlay) {
      FlameAudio.playLongAudio(this);
    }
    FlameAudio.audioCache.play(this);
  }

  ///循环播放音频
  void playLoop({bool longPlay = false, double volume = 1.0}) {
    if (longPlay) {
      FlameAudio.loopLongAudio(this, volume: volume);
    } else {
      FlameAudio.loop(this, volume: volume);
    }
  }

  ///播放背景音乐
  void playBgm() {
    FlameAudio.bgm.play(this);
  }

  /// 暂停背景声音
  void stopBgm() {
    FlameAudio.bgm.stop();
  }

  ///加载图片
  void load() {
    Flame.images.load(this);
  }
}
