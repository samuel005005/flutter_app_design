part of 'shoes_bloc.dart';

@immutable
abstract class ShoesEvent {}

class ChangeShoeSize extends ShoesEvent {
  final double size;
  ChangeShoeSize({required this.size});
}
