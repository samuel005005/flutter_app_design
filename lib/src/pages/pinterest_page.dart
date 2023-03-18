import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinterest_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app_design/src/bloc/pinterest/pinterest_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_app_design/src/widgets/pinterest/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pinterest Page")),
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
    final List<PinterestButton> items = [
      PinterestButton(
          icon: const Icon(Icons.pie_chart),
          onPressed: () {
            if (kDebugMode) {
              print("Icon pie_chart");
            }
          }),
      PinterestButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          if (kDebugMode) {
            print("Icon search");
          }
        },
      ),
      PinterestButton(
        icon: Stack(children: [
          const Icon(Icons.notifications),
          Positioned(
            top: 0.0,
            right: -1.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "14",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ]),
        onPressed: () {
          if (kDebugMode) {
            print("Icon notifications");
          }
        },
      ),
      PinterestButton(
        icon: const Icon(Icons.supervised_user_circle),
        onPressed: () {
          if (kDebugMode) {
            print("Icon supervised_user_circle");
          }
        },
      ),
    ];

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<PinterestBloc, PinterestState>(
            builder: (context, state) {
              if (state is IsShowMenu) {
                return PinterestMenu(
                  show: state.isShow,
                  items: items,
                );
              }
              return PinterestMenu(
                items: items,
              );
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
      if (scrollController.offset > previousScroll &&
          scrollController.offset > 150) {
        context.read<PinterestBloc>().add(const ShowMenu(false));
      } else {
        context.read<PinterestBloc>().add(const ShowMenu(true));
      }

      previousScroll = scrollController.offset;
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
