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
          children: const [
            CustomAppBar(text: 'For you'),
            SizedBox(
              height: 20,
            ),
            ShoesSizePreview(),
          ],
        ),
      ),
    );
  }
}
