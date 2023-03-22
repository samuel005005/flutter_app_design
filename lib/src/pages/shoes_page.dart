import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(text: 'For you'),
          SizedBox(
            height: 20,
          ),
          ShoesSizePreview(),
        ],
      ),
    );
  }
}
