// ignore_for_file: overridden_fields

part of 'layout_bloc.dart';

abstract class LayoutState extends Equatable {
  final Widget currentPage;
  const LayoutState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

class LayoutInitial extends LayoutState {
  const LayoutInitial(super.currentPage);
  @override
  List<Object> get props => [currentPage];
}

class ChangedPage extends LayoutState {
  @override
  final Widget currentPage;
  const ChangedPage(this.currentPage) : super(currentPage);
  @override
  List<Object> get props => [currentPage];
}
