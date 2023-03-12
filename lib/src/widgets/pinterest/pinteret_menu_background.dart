import 'package:flutter/material.dart';

class PinteretMenuBackGround extends StatelessWidget {
  final Widget child;
  const PinteretMenuBackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -2,
          )
        ],
      ),
      child: child,
    );
  }
}
