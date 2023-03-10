import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product/product_bloc.dart';
import 'views/home_view.dart';

class BlocMain extends StatelessWidget {
  const BlocMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
      ],
      child: const HomeView(),
    );
  }
}
