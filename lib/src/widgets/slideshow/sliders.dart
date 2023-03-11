import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/slideshow/bloc/slidershow/slidershow_bloc.dart';

import 'package:flutter_app_design/src/widgets/slideshow/slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Slides extends StatefulWidget {
  final List<Widget> slides;

  const Slides({
    super.key,
    this.slides = const <Widget>[],
  });

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      if (kDebugMode) {
        // print('Current Page: ${pageViewController.page}');
      }
      context
          .read<SlidershowBloc>()
          .add(GetCurrentPage(currentPage: pageViewController.page!));
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => Slide(slide: slide)).toList(),
    );
  }
}
