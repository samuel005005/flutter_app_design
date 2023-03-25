import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/src/bloc/bloc/test_bloc.dart';

import 'package:music_player/src/model/player_model.dart';
import 'package:music_player/src/pages/music_player_page.dart';
import 'package:music_player/src/themes/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlayerModel()),
        BlocProvider(create: (context) => TestBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: myTheme,
        home: const MusicPlayerPage(),
      ),
    );
  }
}
