part of 'pinterest_bloc.dart';

abstract class PinterestEvent extends Equatable {
  const PinterestEvent();
  @override
  List<Object> get props => [];
}

class ChangeOption extends PinterestEvent {
  final int selectedItem;

  const ChangeOption({required this.selectedItem});
  @override
  List<Object> get props => [selectedItem];
}

class ShowMenu extends PinterestEvent {
  final bool show;

  const ShowMenu(this.show);
  @override
  List<Object> get props => [show];
}
