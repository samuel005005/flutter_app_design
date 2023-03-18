// ignore_for_file: overridden_fields

part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final bool darkTheme = false;
  final bool customTheme = false;
  final ThemeData currentTheme = ThemeData.light();

  ThemeState();

  @override
  List<Object> get props => [darkTheme, customTheme];
}

class ThemeInitial extends ThemeState {
  @override
  late final bool darkTheme;
  @override
  late final bool customTheme;
  @override
  late final ThemeData currentTheme;

  ThemeInitial(int item) {
    switch (item) {
      case 1:
        darkTheme = false;
        customTheme = false;
        currentTheme = ThemeData.light();
        break;
      case 2:
        darkTheme = true;
        customTheme = false;
        currentTheme = ThemeData.dark();
        break;
      case 3:
        darkTheme = false;
        customTheme = true;
        currentTheme = ThemeData.light();
        break;
      default:
        darkTheme = false;
        customTheme = false;
        currentTheme = ThemeData.light();
    }
  }

  @override
  List<Object> get props => [currentTheme, darkTheme, customTheme];
}

class ThemeChanged extends ThemeState {
  @override
  final bool darkTheme;
  @override
  final bool customTheme;
  @override
  final ThemeData currentTheme;

  ThemeChanged({
    required this.currentTheme,
    required this.darkTheme,
    required this.customTheme,
  });

  @override
  List<Object> get props => [darkTheme, customTheme];
}
