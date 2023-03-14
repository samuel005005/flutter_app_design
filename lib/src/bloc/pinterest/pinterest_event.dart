part of 'pinterest_bloc.dart';

abstract class PinterestEvent extends Equatable {
  const PinterestEvent();
  @override
  List<Object> get props => [];
}

class ShowMenu extends PinterestEvent {
  final bool show;

  const ShowMenu(this.show);
  @override
  List<Object> get props => [show];
}
