import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'slidershow_event.dart';
part 'slidershow_state.dart';

class SlidershowBloc extends Bloc<SlidershowEvent, SlidershowState> {
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryBullet;
  final double secundaryBullet;
  SlidershowBloc(
      {required this.primaryColor,
      required this.secundaryColor,
      required this.primaryBullet,
      required this.secundaryBullet})
      : super(SlidershowInitial(
            primaryColor, secundaryColor, primaryBullet, secundaryBullet)) {
    on<GetCurrentPage>(_onGetCurrentPage);
  }

  void _onGetCurrentPage(
      GetCurrentPage event, Emitter<SlidershowState> emit) async {
    emit(SlidershowGetPage(
        primaryColor, secundaryColor, primaryBullet, secundaryBullet,
        currentPage: event.currentPage));
  }
}
