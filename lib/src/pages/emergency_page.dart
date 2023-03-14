import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/emergency/header.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HeaderEmergency(),
    );
  }
}
