import 'package:flutter/material.dart';

import 'package:music_player/src/model/player_model.dart';
import 'package:music_player/src/pages/music_player_page.dart';
import 'package:music_player/src/themes/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlayerModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: myTheme,
        home: const MusicPlayerPage(),
      ),
    );
  }
}
