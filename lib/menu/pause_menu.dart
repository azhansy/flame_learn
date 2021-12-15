import 'package:flame_learn/game/moonlander_game.dart';
import 'package:flutter/material.dart';

//
// @author dashu
// @date 12/10/21
// describe:
//

class PauseMenu extends StatelessWidget {
  final MoonlanderGame game;

  const PauseMenu({required this.game, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Center(
                  child: Text(
                    'Pause',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => game.overlays.remove('pause'),
                  child: const Text('Resume'),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('pause');
                    game.restart();
                  },
                  child: const Text('Restart'),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('pause');
                    // game.overlays.add('levels');
                  },
                  child: const Text('Levels'),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () => game.overlays.remove('pause'),
                  child: const Text('Exit'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
