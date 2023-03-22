part of 'shoes_bloc.dart';

@immutable
abstract class ShoesState {
  final double size = 7;
  const ShoesState();
}

class ShoesInitial extends ShoesState {
  const ShoesInitial();
}

class ShoeSizeChanged extends ShoesState {
  @override
  // ignore: overridden_fields
  final double size;

  const ShoeSizeChanged({required this.size});
}
