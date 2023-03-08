import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryThickness;

  const RadialProgress({
    super.key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.secondaryThickness = 4,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  double beforcePercentage = 0.0;

  @override
  void initState() {
    beforcePercentage = widget.percentage;

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.addListener(() {
      if (kDebugMode) {
        print('animationController.value ${animationController.value}');
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
    animationController.forward(from: 0.0);

    final animatedDifference = widget.percentage - beforcePercentage;

    beforcePercentage = widget.percentage;

    if (kDebugMode) {
      print('widget.percentage ${widget.percentage}');
      print('beforcePercentage $beforcePercentage');
      print('animatedDifference $animatedDifference');
      print(
          'widget.percentage - animatedDifference ${widget.percentage - animatedDifference}');
      print(
          'animatedDifference * animationController.value ${animatedDifference * animationController.value}');
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProsgress(
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              secondaryThickness: widget.secondaryThickness,
              percentage: (widget.percentage - animatedDifference) +
                  (animatedDifference * animationController.value),
            ),
          ),
        );
      },
    );
  }
}

class _MyRadialProsgress extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryThickness;
  _MyRadialProsgress({
    required this.percentage,
    required this.primaryColor,
    required this.secondaryColor,
    required this.secondaryThickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = secondaryThickness
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height * .5);
    final double radius = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radius, paint);
    // Arco
    final painArco = Paint()
      ..strokeWidth = 10
      ..color = primaryColor
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        (3 * pi) / 2, arcAngle, false, painArco);
  }

  @override
  bool shouldRepaint(oldDelegate) => true;
}
