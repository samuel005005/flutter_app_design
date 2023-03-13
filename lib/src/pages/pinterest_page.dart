import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinterest_menu.dart';
import 'package:flutter_app_design/src/widgets/pinterest/bloc/pinterest/pinterest_bloc.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PinterestBloc(),
        child: Stack(
          children: [
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<PinterestBloc, PinterestState>(
            builder: (context, state) {
              if (state is IsShowMenu) {
                return PinterestMenu(show: state.isShow);
              }
              return const PinterestMenu();
            },
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController scrollController = ScrollController();

  double previousScroll = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > 150) {
        if (scrollController.offset > previousScroll) {
          context.read<PinterestBloc>().add(const ShowMenu(false));
        } else {
          context.read<PinterestBloc>().add(const ShowMenu(true));
        }

        previousScroll = scrollController.offset;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: index.isEven ? 200 : 300,
          child: _PinteresItem(index),
        );
      },
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;
  const _PinteresItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue,
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
