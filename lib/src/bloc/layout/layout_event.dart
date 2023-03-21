part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  const LayoutEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends LayoutEvent {
  final Widget currentPage;
  const ChangePage({required this.currentPage});
  @override
  List<Object> get props => [currentPage];
}
