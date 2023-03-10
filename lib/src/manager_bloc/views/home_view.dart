import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/manager_bloc/bloc/product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductBloc>().add(const GetProducts());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) => state is LoadedProducts
              ? Text('Productos (${state.products.length})')
              : const Text('Productos (0)'),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedProducts) {
          return CustomListView(products: state.products);
        }
        return const SizedBox();
      }),
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<String> products;
  const CustomListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(products[index]),
      ),
    );
  }
}
