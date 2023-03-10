import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/slidershow/slidershow_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SlidershowBloc(),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides(),
              ),
              const _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidershowBloc, SlidershowState>(
      builder: (context, state) {
        final pageViewIndex =
            state is SlidershowGetPage ? state.currentPage : 0.0;

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

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      if (kDebugMode) {
        print('Current Page: ${pageViewController.page}');
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
      children: const [
        _Slide(svg: 'assets/svgs/slide-1.svg'),
        _Slide(svg: 'assets/svgs/slide-2.svg'),
        _Slide(svg: 'assets/svgs/slide-3.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(svg),
    );
  }
}
