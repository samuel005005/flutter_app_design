import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/emergency/button.dart';
import 'package:flutter_app_design/src/widgets/emergency/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  final items = <ItemBoton>[
    ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
        const Color(0xff6989F5), const Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
        const Color(0xff66A9F2), const Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
        const Color(0xffF2D572), const Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183),
        const Color(0xff46997D)),
    ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
        const Color(0xff6989F5), const Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
        const Color(0xff66A9F2), const Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
        const Color(0xffF2D572), const Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183),
        const Color(0xff46997D)),
    ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
        const Color(0xff6989F5), const Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
        const Color(0xff66A9F2), const Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
        const Color(0xffF2D572), const Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183),
        const Color(0xff46997D)),
  ];

  EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> itemMap = items
        .map(
          (item) => Button(
            text: item.text,
            icon: item.icon,
            color1: item.color1,
            color2: item.color2,
            onPress: () {},
          ),
        )
        .toList();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              ...itemMap,
            ],
          ),
        ),
        Stack(
          children: [
            const HeaderEmergency(
              icon: FontAwesomeIcons.plus,
              title: "Asistencia Medica",
              subtitle: "Haz solicitado",
            ),
            Positioned(
              top: 30,
              right: 0,
              child: RawMaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15.0),
                child: const Icon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
