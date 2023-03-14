part of 'pinterest_menu_bloc.dart';

abstract class PinterestMenuEvent extends Equatable {
  const PinterestMenuEvent();

  @override
  List<Object> get props => [];
}

class ChangeOption extends PinterestMenuEvent {
  final int selectedItem;

  const ChangeOption({required this.selectedItem});
  @override
  List<Object> get props => [selectedItem];
}
