import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_app_design/src/pages/launcher_page.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => ThemeBloc(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.currentTheme,
          debugShowCheckedModeBanner: false,
          title: 'Diseños App',
          home: const LauncherPage(),
        );
      },
    );
  }
}
