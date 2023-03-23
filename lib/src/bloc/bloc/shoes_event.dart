part of 'shoes_bloc.dart';

abstract class ShoesEvent extends Equatable {
  const ShoesEvent();
  @override
  List<Object> get props => [];
}

class ChangeShoeSize extends ShoesEvent {
  final double size;
  const ChangeShoeSize({required this.size});

  @override
  List<Object> get props => [size];
}

class ChangeShoeImage extends ShoesEvent {
  final String assetImage;
  const ChangeShoeImage({required this.assetImage});

  @override
  List<Object> get props => [assetImage];
}
