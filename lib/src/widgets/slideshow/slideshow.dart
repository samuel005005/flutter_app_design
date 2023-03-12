import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/slideshow/bloc/slidershow/slidershow_bloc.dart';
import 'package:flutter_app_design/src/widgets/slideshow/sliders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dots.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool indicationUpPosition;
  final Color primaryColor;
  final Color secundaryColor;

  const SlideShow({
    super.key,
    this.slides = const <Widget>[],
    this.indicationUpPosition = false,
    this.primaryColor = Colors.blue,
    this.secundaryColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SlidershowBloc(
          primaryColor: primaryColor, secundaryColor: secundaryColor),
      child: SafeArea(
        child: Center(
          child: _CreateStructSlideShow(
              indicationUpPosition: indicationUpPosition, slides: slides),
        ),
      ),
    );
  }
}

class _CreateStructSlideShow extends StatelessWidget {
  const _CreateStructSlideShow({
    required this.indicationUpPosition,
    required this.slides,
  });

  final bool indicationUpPosition;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (indicationUpPosition) Dots(slideCount: slides.length),
        Expanded(
          child: Slides(slides: slides),
        ),
        if (!indicationUpPosition) Dots(slideCount: slides.length),
      ],
    );
  }
}
