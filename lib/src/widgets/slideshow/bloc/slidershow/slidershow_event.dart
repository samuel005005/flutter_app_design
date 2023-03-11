part of 'slidershow_bloc.dart';

abstract class SlidershowEvent extends Equatable {
  const SlidershowEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentPage extends SlidershowEvent {
  final double currentPage;

  const GetCurrentPage({this.currentPage = 0});

  @override
  List<Object> get props => [currentPage];
}
