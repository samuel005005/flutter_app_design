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
  List<Object> get props => [];
}
