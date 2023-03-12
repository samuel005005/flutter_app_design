import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'slidershow_event.dart';
part 'slidershow_state.dart';

class SlidershowBloc extends Bloc<SlidershowEvent, SlidershowState> {
  final Color primaryColor;
  final Color secundaryColor;
  SlidershowBloc({required this.primaryColor, required this.secundaryColor})
      : super(SlidershowInitial(primaryColor, secundaryColor)) {
    on<GetCurrentPage>(_onGetCurrentPage);
  }

  void _onGetCurrentPage(
      GetCurrentPage event, Emitter<SlidershowState> emit) async {
    emit(SlidershowGetPage(primaryColor, secundaryColor,
        currentPage: event.currentPage));
  }
}
