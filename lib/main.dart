import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/pages/slideshow_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app_design/src/bloc/layout/layout_bloc.dart';
import 'package:flutter_app_design/src/pages/launcher_page.dart';
import 'package:flutter_app_design/src/pages/launcher_tablet_page.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(2),
          ),
          BlocProvider(
            create: (context) => LayoutBloc(const SlideShowPage()),
          )
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeBloc>().state.currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          }
          return const LauncherPage();
        },
      ),
    );
  }
}
