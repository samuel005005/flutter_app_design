import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          const Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList(),
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = (width > 500) ? width - 320 : width;

    return SizedBox(
      width: width * .9,
      height: 100,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              backgroundColor: state.darkTheme
                  ? state.currentTheme.colorScheme.secondary
                  : const Color(
                      0xffED6762,
                    ),
            ),
            child: Text(
              "CREATE NEW LIST",
              style: TextStyle(
                color: state.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ItemSilver('Orange', Color(0xffF08F66)),
    const _ItemSilver('Family', Color(0xffF2A38A)),
    const _ItemSilver('Subscriptions', Color(0xffF7CDD5)),
    const _ItemSilver('Books', Color(0xffFCEBAF)),
    const _ItemSilver('Orange', Color(0xffF08F66)),
    const _ItemSilver('Family', Color(0xffF2A38A)),
    const _ItemSilver('Subscriptions', Color(0xffF7CDD5)),
    const _ItemSilver('Books', Color(0xffFCEBAF)),
    const SizedBox(height: 100)
  ];

  _MainScroll();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // const SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   centerTitle: true,
        //   backgroundColor: Colors.red,
        //   title: Text("Hello Word"),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 220,
            minHeight: 200,
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Container(
                  alignment: Alignment.centerLeft,
                  color: state.currentTheme.scaffoldBackgroundColor,
                  child: Stack(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: _Title(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([...items]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child})
      : assert(maxHeight > minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "New",
                style: TextStyle(
                  color:
                      state.darkTheme ? Colors.grey : const Color(0xff532128),
                  fontSize: 40,
                ),
              ),
            ),
            Stack(
              children: [
                const SizedBox(width: 60),
                Positioned(
                  bottom: 8,
                  left: -25,
                  child: Container(
                    width: 160,
                    height: 4,
                    color:
                        state.darkTheme ? Colors.grey : const Color(0xffF7CDD5),
                  ),
                ),
                const Text(
                  "List",
                  style: TextStyle(
                      color: Color(0xffD93A30),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

// class _TaskList extends StatelessWidget {
//   final items = [
//     const _ItemSilver('Orange', Color(0xffF08F66)),
//     const _ItemSilver('Family', Color(0xffF2A38A)),
//     const _ItemSilver('Subscriptions', Color(0xffF7CDD5)),
//     const _ItemSilver('Books', Color(0xffFCEBAF)),
//     const _ItemSilver('Orange', Color(0xffF08F66)),
//     const _ItemSilver('Family', Color(0xffF2A38A)),
//     const _ItemSilver('Subscriptions', Color(0xffF7CDD5)),
//     const _ItemSilver('Books', Color(0xffFCEBAF)),
//     const SizedBox(height: 100)
//   ];
//   _TaskList();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return items[index];
//       },
//     );
//   }
// }

class _ItemSilver extends StatelessWidget {
  final String title;
  final Color color;
  const _ItemSilver(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(30),
          height: 130,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: state.darkTheme ? Colors.grey : color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
