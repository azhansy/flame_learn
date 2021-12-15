import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/moonlander_game.dart';
import 'menu/pause_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //设置横屏
  await Flame.device.setLandscape();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final game = MoonlanderGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: game,
      loadingBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorBuilder: (context, ex) {
        debugPrint(ex.toString());
        return Center(
          child: Text(
              'Sorry, something went wrong. Reload me\n${ex.toString()}'),
        );
      },
      // backgroundBuilder: (BuildContext context) => Container(color: Colors.blue,),
      overlayBuilderMap: {
        'pause': (context, MoonlanderGame game) => PauseMenu(game: game),
      },
    );
  }
}
