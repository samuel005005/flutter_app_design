part of 'shoes_bloc.dart';

abstract class ShoesState extends Equatable {
  final double size = 7;
  const ShoesState();
  @override
  List<Object> get props => [size];
}

class ShoesInitial extends ShoesState {
  const ShoesInitial();

  @override
  List<Object> get props => [size];
}

class ShoeSizeChanged extends ShoesState {
  @override
  // ignore: overridden_fields
  final double size;

  const ShoeSizeChanged({required this.size});
  @override
  List<Object> get props => [size];
}
