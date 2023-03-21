import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/slideshow/slideshow.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge = (MediaQuery.of(context).size.height > 500) ? true : false;

    final children = [
      const Expanded(child: MySlideShow()),
      const Expanded(child: MySlideShow())
    ];

    return Scaffold(
      body: (isLarge)
          ? Column(children: children)
          : Row(
              children: children,
            ),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final secondary = state.currentTheme.colorScheme.secondary;
        return SlideShow(
          indicationUpPosition: false,
          primaryColor: state.darkTheme ? secondary : const Color(0xffFF5A7E),
          // secundaryColor: secondary,
          primaryBullet: 15,
          secundaryBullet: 12,
          slides: <Widget>[
            SvgPicture.asset('assets/svgs/slide-1.svg'),
            SvgPicture.asset('assets/svgs/slide-2.svg'),
            SvgPicture.asset('assets/svgs/slide-3.svg'),
            SvgPicture.asset('assets/svgs/slide-4.svg'),
            SvgPicture.asset('assets/svgs/slide-5.svg'),
          ],
        );
      },
    );
  }
}
