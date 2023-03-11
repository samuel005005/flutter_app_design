import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/slidershow/slidershow_bloc.dart';

class Dot extends StatelessWidget {
  final int index;

  const Dot({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidershowBloc, SlidershowState>(
      builder: (context, state) {
        final pageViewIndex = state.currentPage;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
                ? Colors.red
                : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
