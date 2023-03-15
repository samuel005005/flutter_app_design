import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderEmergency extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color1;
  final Color color2;

  const HeaderEmergency({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
  });

  @override
  Widget build(BuildContext context) {
    final whiteColor = Colors.white.withOpacity(.7);
    return Stack(
      children: [
        _HeaderBackground(color1, color2),
        Positioned(
          top: -60,
          left: -70,
          child: Icon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(subtitle, style: TextStyle(fontSize: 20, color: whiteColor)),
            Text(title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: whiteColor)),
            const SizedBox(height: 30),
            FaIcon(icon, size: 80, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _HeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
