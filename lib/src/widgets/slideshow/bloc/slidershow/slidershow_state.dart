part of 'slidershow_bloc.dart';

abstract class SlidershowState extends Equatable {
  final Color primaryColor;
  final Color secundaryColor;
  const SlidershowState(this.primaryColor, this.secundaryColor);

  @override
  List<Object> get props => [];

  set primaryColor(Color value) {
    primaryColor = value;
  }
}

class SlidershowInitial extends SlidershowState {
  const SlidershowInitial(primaryColor, secundaryColor)
      : super(primaryColor, secundaryColor);
  @override
  List<Object> get props => [];
}

class SlidershowGetPage extends SlidershowState {
  final double currentPage;
  const SlidershowGetPage(super.primaryColor, super.secundaryColor,
      {required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
