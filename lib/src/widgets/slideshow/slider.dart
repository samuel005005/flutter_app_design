import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final Widget slide;
  const Slide({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: slide,
    );
  }
}
