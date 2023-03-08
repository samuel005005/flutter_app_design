import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animationController.addListener(() {
      if (kDebugMode) {
        print('Valor Controller : ${animationController.value}');
      }

      setState(() {
        percentage =
            lerpDouble(percentage, newPercentage, animationController.value)!;
      });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
          }
          animationController.forward(from: 0.0);
          setState(() {});
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProsgress(percentage: percentage),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProsgress extends CustomPainter {
  final double percentage;
  _MyRadialProsgress({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    // Circle Completed
    final paint = Paint()
      ..strokeWidth = 20
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height * .5);
    final double radius = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radius, paint);
    // Arco
    final painArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        (3 * pi) / 2, arcAngle, false, painArco);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
