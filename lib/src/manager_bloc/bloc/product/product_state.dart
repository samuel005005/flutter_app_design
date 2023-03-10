part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class LoadedProducts extends ProductState {
  final List<String> products;
  const LoadedProducts({this.products = const <String>[]});

  @override
  List<Object> get props => [products];
}
