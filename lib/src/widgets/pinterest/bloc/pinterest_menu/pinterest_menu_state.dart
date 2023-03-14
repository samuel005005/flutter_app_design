part of 'pinterest_menu_bloc.dart';

abstract class PinterestMenuState extends Equatable {
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  const PinterestMenuState(
      this.backgroundColor, this.activeColor, this.inactiveColor);

  @override
  List<Object> get props => [];
}

class PinterestMenuInitial extends PinterestMenuState {
  const PinterestMenuInitial(
      super.backgroundColor, super.activeColor, super.inactiveColor);
}

class ItemSelected extends PinterestMenuState {
  final int selectedItem;
  const ItemSelected(
      backgroundColor, activeColor, inactiveColor, this.selectedItem)
      : super(backgroundColor, activeColor, inactiveColor);

  @override
  List<Object> get props =>
      [selectedItem, backgroundColor, activeColor, inactiveColor];
}
