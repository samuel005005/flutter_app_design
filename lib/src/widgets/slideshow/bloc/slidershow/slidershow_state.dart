part of 'slidershow_bloc.dart';

abstract class SlidershowState extends Equatable {
  final double currentPage;
  final Color primaryColor;
  const SlidershowState(
      {this.currentPage = 0, this.primaryColor = Colors.blue});

  @override
  List<Object> get props => [];
}

class SlidershowInitial extends SlidershowState {}

class SlidershowGetPage extends SlidershowState {
  @override
  // ignore: overridden_fields
  final double currentPage;
  const SlidershowGetPage({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
