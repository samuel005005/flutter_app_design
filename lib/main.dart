import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/pages/pinterest_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: PinterestPage(),
    );
  }
}
