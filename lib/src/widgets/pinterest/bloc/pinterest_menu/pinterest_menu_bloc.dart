import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'pinterest_menu_event.dart';
part 'pinterest_menu_state.dart';

class PinterestMenuBloc extends Bloc<PinterestMenuEvent, PinterestMenuState> {
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  PinterestMenuBloc(this.backgroundColor, this.activeColor, this.inactiveColor)
      : super(
            PinterestMenuInitial(backgroundColor, activeColor, inactiveColor)) {
    on<ChangeOption>(_onChangeItem);
  }
  void _onChangeItem(ChangeOption event, emit) {
    emit(ItemSelected(
        backgroundColor, activeColor, inactiveColor, event.selectedItem));
  }
}
