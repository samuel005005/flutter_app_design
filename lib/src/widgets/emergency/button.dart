import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;

  const Button(
      {super.key,
      this.icon = FontAwesomeIcons.icons,
      required this.text,
      this.color1 = const Color(0xff6989F5),
      this.color2 = const Color(0xff906EF5),
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonBackground(color1, color2),
          Row(
            children: [
              const SizedBox(height: 140, width: 40),
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Expanded(
                child: Text(text,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const Icon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _ButtonBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [color1, color2],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: -25,
              right: 6,
              child: Icon(
                FontAwesomeIcons.carBurst,
                size: 150,
                color: Colors.white.withOpacity(.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
