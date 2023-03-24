import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc() : super(AudioPlayerInitial()) {
    // on<AudioPlayerAnimate>(onAudioPlayerAnimate);
  }
  // onAudioPlayerAnimate(AudioPlayerAnimate event, emit) {
  //   print(event.controller);
  //   emit(AudioPlayerAnimated(event.controller));
  // }
}
