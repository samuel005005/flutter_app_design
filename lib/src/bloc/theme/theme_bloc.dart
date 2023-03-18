import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
      currentTheme = ThemeData.dark();
    } else {
      currentTheme = ThemeData.light();
    }

    if (event.customTheme) {
      currentTheme = ThemeData.light();
    }

    emit(ThemeChanged(
        customTheme: event.customTheme,
        darkTheme: event.darkTheme,
        currentTheme: currentTheme));
  }
}