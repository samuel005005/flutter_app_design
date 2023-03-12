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
        if (state is SlidershowGetPage) {
          final pageViewIndex = state.currentPage;
          return _ContainerDoc(
            index: index,
            pageViewIndex: pageViewIndex,
            primaryColor: state.primaryColor,
            secundaryColor: state.secundaryColor,
          );
        }

        return _ContainerDoc(
          index: index,
          pageViewIndex: 0,
          primaryColor: state.primaryColor,
          secundaryColor: state.secundaryColor,
        );
      },
    );
  }
}

class _ContainerDoc extends StatelessWidget {
  final int index;
  final double pageViewIndex;
  final Color primaryColor;
  final Color secundaryColor;
  const _ContainerDoc({
    required this.index,
    required this.pageViewIndex,
    required this.primaryColor,
    required this.secundaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? primaryColor
            : secundaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
