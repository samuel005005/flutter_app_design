import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SquareAnimaded(),
      ),
    );
  }
}

class SquareAnimaded extends StatefulWidget {
  const SquareAnimaded({
    super.key,
  });

  @override
  State<SquareAnimaded> createState() => _SquareAnimadedState();
}

class _SquareAnimadedState extends State<SquareAnimaded>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> rotate;
  late Animation<double> opacity;
  late Animation<double> moveRight;
  late Animation<double> enlarge;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotate = Tween(begin: 0.0, end: 4 * pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          0.25,
          curve: Curves.easeOut,
        ),
      ),
    );

    moveRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    enlarge = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.addListener(() {
      if (kDebugMode) {
        print('Status: ${animationController.status}');
      }

      if (animationController.status == AnimationStatus.completed) {
        animationController.repeat();
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
      child: const _Rectangle(),
      builder: (context, childRentangle) => Transform.translate(
        offset: Offset(moveRight.value, 0),
        child: Transform.rotate(
          angle: rotate.value,
          child: Opacity(
            opacity: opacity.value,
            child: Transform.scale(
              scale: enlarge.value,
              child: childRentangle,
            ),
          ),
        ),
      ),
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
      decoration: const BoxDecoration(color: Colors.red),
    );
  }
}
