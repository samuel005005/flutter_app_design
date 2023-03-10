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
}
