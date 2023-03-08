import 'package:flutter/material.dart';
import 'package:flutter_app_design/src/widgets/radial_progress.dart';

class CircularGraphPage extends StatefulWidget {
  const CircularGraphPage({super.key});

  @override
  State<CircularGraphPage> createState() => _CircularGraphPageState();
}

class _CircularGraphPageState extends State<CircularGraphPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: RadialProgress(
            percentage: percentage,
            primaryColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
