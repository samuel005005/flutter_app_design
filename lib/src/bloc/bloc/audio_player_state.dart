part of 'audio_player_bloc.dart';

abstract class AudioPlayerState {
  late AnimationController controller;
  final bool isPlaying = false;
}

class AudioPlayerInitial extends AudioPlayerState {
  AudioPlayerInitial();
}
