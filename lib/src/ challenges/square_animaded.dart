import 'package:flutter/material.dart';

class SquareAnimadedPage extends StatelessWidget {
  const SquareAnimadedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SquareAnimadedWidget(),
      ),
    );
  }
}

class SquareAnimadedWidget extends StatefulWidget {
  const SquareAnimadedWidget({super.key});

  @override
  State<SquareAnimadedWidget> createState() => _SquareAnimadedWidgetState();
}

class _SquareAnimadedWidgetState extends State<SquareAnimadedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> moveRigth;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moveRigth = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moveUp = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moveLeft = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.50,
          0.75,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moveDown = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.75,
          1.0,
          curve: Curves.bounceOut,
        ),
      ),
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            moveRigth.value + moveLeft.value,
            moveUp.value + moveDown.value,
          ),
          child: const _Rectangle(),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}
