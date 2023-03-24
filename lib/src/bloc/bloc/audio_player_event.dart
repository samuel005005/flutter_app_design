part of 'audio_player_bloc.dart';

abstract class AudioPlayerEvent extends Equatable {
  const AudioPlayerEvent();

  @override
  List<Object> get props => [];
}

class AudioPlayerAnimate extends AudioPlayerEvent {
  final AnimationController controller;
  const AudioPlayerAnimate(this.controller);
  @override
  List<Object> get props => [controller];
}
