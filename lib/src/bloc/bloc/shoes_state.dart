// ignore_for_file: overridden_fields

part of 'shoes_bloc.dart';

abstract class ShoesState extends Equatable {
  final String assetImage = 'azul.png';
  final double size = 7;
  const ShoesState();
  @override
  List<Object> get props => [size];
}

class ShoesInitial extends ShoesState {
  const ShoesInitial();

  @override
  List<Object> get props => [size, assetImage];
}

class ShoeSizeChanged extends ShoesState {
  @override
  final double size;
  const ShoeSizeChanged({required this.size});
  @override
  List<Object> get props => [size];
}

class ShoeImageChanged extends ShoesState {
  @override
  final String assetImage;
  const ShoeImageChanged({required this.assetImage});
  @override
  List<Object> get props => [assetImage];
}
