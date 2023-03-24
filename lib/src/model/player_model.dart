import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  late AnimationController controller;

  final bool isPlaying = false;

  Duration _sonDuration = const Duration(milliseconds: 0);
  Duration _currentDuration = const Duration(milliseconds: 0);

  set sonDuration(Duration value) {
    _sonDuration = value;
    notifyListeners();
  }

  set currentDuration(Duration value) {
    _currentDuration = value;
    notifyListeners();
  }

  String get sonTotalDuration => _printDuration(_sonDuration);

  String get currentTotalDuration => _printDuration(_currentDuration);

  double get percentage => _sonDuration.inSeconds > 0
      ? _currentDuration.inSeconds / _sonDuration.inSeconds
      : 0;

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return "0$n";
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitsMinutes:$twoDigitsSeconds';
  }
}
