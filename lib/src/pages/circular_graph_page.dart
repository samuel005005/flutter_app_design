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
      appBar: AppBar(
        title: const Text("Circular Graph Page"),
      ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.red,
              ),
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.purple,
              ),
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress(
      {super.key, required this.percentage, required this.color});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
        primaryThickness: 10,
        secondaryThickness: 5,
      ),
    );
  }
}
