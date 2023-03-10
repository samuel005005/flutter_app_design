import 'dart:async';

const listrProducts = <String>['Microfono', 'Partalnte', 'Teclado', 'Camara'];

class ProductsBloc {
  Stream<List<String>> get getProducts async* {
    final List<String> products = [];
    for (String product in listrProducts) {
      await Future.delayed(const Duration(seconds: 2));
      products.add(product);
      yield products;
    }
  }

  final StreamController<int> _counterProducts = StreamController();

  Stream<int> get counterProducts => _counterProducts.stream;

  ProductsBloc() {
    getProducts
        .listen((listProducts) => _counterProducts.add(listProducts.length));
  }

  void dispose() {
    _counterProducts.close();
  }
}
