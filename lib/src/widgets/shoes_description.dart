import 'package:flutter/material.dart';

class ShoesDescription extends StatelessWidget {
  final String title;
  final String description;
  const ShoesDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, height: 1.6),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
