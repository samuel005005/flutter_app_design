import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  const Button(
      {super.key,
      required this.text,
      this.width = 150,
      this.height = 50,
      this.backgroundColor = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
