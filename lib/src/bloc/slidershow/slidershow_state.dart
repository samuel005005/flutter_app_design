part of 'slidershow_bloc.dart';

abstract class SlidershowState extends Equatable {
  const SlidershowState();

  @override
  List<Object> get props => [];
}

class SlidershowInitial extends SlidershowState {}

class SlidershowGetPage extends SlidershowState {
  final double currentPage;

  const SlidershowGetPage(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
