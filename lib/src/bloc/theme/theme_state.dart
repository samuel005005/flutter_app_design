part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final bool darkTheme = false;
  final bool customTheme = false;
  final ThemeData currentTheme;
  const ThemeState(this.currentTheme);

  @override
  List<Object> get props => [darkTheme, customTheme];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({currentTheme}) : super(currentTheme);
}

class ThemeChanged extends ThemeState {
  @override
  // ignore: overridden_fields
  final bool darkTheme;
  @override
  // ignore: overridden_fields
  final bool customTheme;
  @override
  // ignore: overridden_fields
  final ThemeData currentTheme;

  const ThemeChanged({
    required this.currentTheme,
    required this.darkTheme,
    required this.customTheme,
  }) : super(currentTheme);

  @override
  List<Object> get props => [darkTheme, customTheme];
}
