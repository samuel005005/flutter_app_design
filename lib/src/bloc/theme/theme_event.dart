part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final bool darkTheme;
  final bool customTheme;

  const ChangeTheme({required this.darkTheme, required this.customTheme});
  @override
  List<Object> get props => [darkTheme, customTheme];
}
