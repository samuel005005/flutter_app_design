import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  final Widget currentPage;
  LayoutBloc(this.currentPage) : super(LayoutInitial(currentPage)) {
    on<ChangePage>(_onChangePage);
  }

  void _onChangePage(ChangePage event, emit) {
    emit(ChangedPage(event.currentPage));
  }
}
