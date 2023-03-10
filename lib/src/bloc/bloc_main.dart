import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/bloc/products_bloc.dart';

class BlocMain extends StatelessWidget {
  BlocMain({super.key});

  final productsBloc = ProductsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<int>(
          stream: productsBloc.counterProducts,
          builder: (context, snapshot) =>
              Text('Productos (${snapshot.data ?? 0})'),
        ),
      ),
      body: StreamBuilder<List<String>>(
        stream: productsBloc.getProducts,
        builder: (context, snapshot) {
          final products = snapshot.data ?? [];

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(products[index]),
            ),
          );
        },
      ),
    );
  }
}
