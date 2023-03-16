import 'package:flutter/material.dart';

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
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .9,
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
          backgroundColor: const Color(
            0xffED6762,
          ),
        ),
        child: const Text(
          "CREATE NEW LIST",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
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
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Title(),
            ),
          ),
        ),
        SliverList(
          delegate:
              SliverChildListDelegate([...items, const SizedBox(height: 100)]),
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
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text(
            "New",
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              left: -25,
              child: Container(
                width: 160,
                height: 8,
                color: const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              "List",
              style: TextStyle(
                  color: Color(0xffD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class _TaskList extends StatelessWidget {
  final items = [
    const _ItemSilver('Orange', Color(0xffF08F66)),
    const _ItemSilver('Family', Color(0xffF2A38A)),
    const _ItemSilver('Subscriptions', Color(0xffF7CDD5)),
    const _ItemSilver('Books', Color(0xffFCEBAF)),
    const _ItemSilver('Orange', Color(0xffF08F66)),
    const _ItemSilver('Family', Color(0xffF2A38A)),
    const _ItemSilver('Subscriptions', Color(0xffF7CDD5)),
    const _ItemSilver('Books', Color(0xffFCEBAF)),
  ];
  _TaskList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}

class _ItemSilver extends StatelessWidget {
  final String title;
  final Color color;
  const _ItemSilver(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
