part of 'slidershow_bloc.dart';

abstract class SlidershowState extends Equatable {
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryBullet;
  final double secundaryBullet;
  const SlidershowState(this.primaryColor, this.secundaryColor,
      this.primaryBullet, this.secundaryBullet);

  @override
  List<Object> get props => [];

  set primaryColor(Color value) {
    primaryColor = value;
  }
}

class SlidershowInitial extends SlidershowState {
  const SlidershowInitial(
      primaryColor, secundaryColor, primaryBullet, secundaryBullet)
      : super(primaryColor, secundaryColor, primaryBullet, secundaryBullet);
  @override
  List<Object> get props => [];
}

class SlidershowGetPage extends SlidershowState {
  final double currentPage;
  const SlidershowGetPage(super.primaryColor, super.secundaryColor,
      super.primaryBullet, super.secundaryBullet,
      {required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
