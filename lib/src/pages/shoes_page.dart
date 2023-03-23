import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/src/bloc/bloc/shoes_bloc.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoesBloc(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(text: 'For you'),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: const [
                    ShoesSizePreview(),
                    ShoesDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                  ],
                ),
              ),
            ),
            const AddCarButton(amout: 180.0),
          ],
        ),
      ),
    );
  }
}
