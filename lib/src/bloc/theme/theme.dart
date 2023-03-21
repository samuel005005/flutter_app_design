import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: Colors.pink,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: Colors.pink,
      ),
    );
  }

  static ThemeData get customTheme {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: const Color(0xff48A0EB),
      ),
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: const Color(0xff16202B),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
      ),
    );
  }
}
