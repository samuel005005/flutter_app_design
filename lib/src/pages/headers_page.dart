import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeBloc>().state;
    return Scaffold(
      body: HeaderWave(
        color: appTheme.currentTheme.colorScheme.secondary,
        secondaryColor: appTheme.darkTheme ? Colors.black : Colors.white,
      ),
    );
  }
}
