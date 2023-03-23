import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/src/bloc/bloc/shoes_bloc.dart';
import 'package:shoes_app/src/pages/shoes_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoesBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes App',
        home: ShoesPage(),
      ),
    );
  }
}
