import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final int item;
  ThemeBloc(this.item) : super(ThemeInitial(item)) {
    on<ChangeTheme>(_onChangeTheme);
  }

  void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    late ThemeData currentTheme;

    if (event.darkTheme) {
      currentTheme = CustomTheme.darkTheme;
    } else {
      currentTheme = CustomTheme.lightTheme;
    }

    if (event.customTheme) {
      currentTheme = CustomTheme.customTheme;
    }

    emit(ThemeChanged(
        customTheme: event.customTheme,
        darkTheme: event.darkTheme,
        currentTheme: currentTheme));
  }
}
