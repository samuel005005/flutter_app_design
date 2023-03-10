import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/bloc_main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: BlocMain(),
    );
  }
}
