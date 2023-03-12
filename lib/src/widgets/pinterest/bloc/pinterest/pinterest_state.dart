part of 'pinterest_bloc.dart';

abstract class PinterestState extends Equatable {
  const PinterestState();

  @override
  List<Object> get props => [];
}

class PinterestInitial extends PinterestState {
  const PinterestInitial();
}

class ItemSelected extends PinterestState {
  final int selectedItem;
  const ItemSelected(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}

class IsShowMenu extends PinterestState {
  final bool isShow;

  const IsShowMenu(this.isShow);
  @override
  List<Object> get props => [isShow];
}
