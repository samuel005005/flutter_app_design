part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductEvent {
  final List<String> products;

  const GetProducts({this.products = const <String>[]});

  @override
  List<Object> get props => [products];
}
