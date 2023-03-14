import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderEmergency extends StatelessWidget {
  const HeaderEmergency({super.key});

  @override
  Widget build(BuildContext context) {
    final whiteColor = Colors.white.withOpacity(.7);
    return Stack(
      children: [
        const _HeaderBackground(),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Text(
              "Haz solicitado",
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),
            Text(
              "Asistencia Medica",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: whiteColor),
            ),
            const SizedBox(height: 80),
            const FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff526BF6),
            Color(0xff67ACF2),
          ],
        ),
      ),
    );
  }
}
