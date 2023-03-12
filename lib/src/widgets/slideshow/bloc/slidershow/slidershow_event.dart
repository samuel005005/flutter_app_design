part of 'slidershow_bloc.dart';

abstract class SlidershowEvent extends Equatable {
  const SlidershowEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentPage extends SlidershowEvent {
  final double currentPage;

  const GetCurrentPage({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}

class ChageBullerPrimaryColor extends SlidershowEvent {
  final Color primaryColor;

  const ChageBullerPrimaryColor({required this.primaryColor});

  @override
  List<Object> get props => [primaryColor];
}
