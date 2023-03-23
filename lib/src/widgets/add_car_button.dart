import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class AddCarButton extends StatelessWidget {
  final double amout;
  const AddCarButton({super.key, required this.amout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 85,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '\$$amout',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Button(text: "Add to cart"),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
