import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/bloc/products_bloc.dart';

class BlocMain extends StatelessWidget {
  BlocMain({super.key});

  final productsBloc = ProductsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos (xx)'),
      ),
      body: StreamBuilder<List<String>>(
        stream: productsBloc.getProducts,
        builder: (context, snapshot) {
          print(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, index) => const ListTile(title: Text("ABC")),
          );
        },
      ),
    );
  }
}
