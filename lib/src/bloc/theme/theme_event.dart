part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class InitTheme extends ThemeEvent {
  final int theme;
  const InitTheme(this.theme);
  @override
  List<Object> get props => [theme];
}

class ChangeTheme extends ThemeEvent {
  final bool darkTheme;
  final bool customTheme;

  const ChangeTheme({required this.darkTheme, required this.customTheme});
  @override
  List<Object> get props => [darkTheme, customTheme];
}
