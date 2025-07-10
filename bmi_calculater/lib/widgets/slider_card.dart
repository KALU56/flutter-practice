import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String label;
  final double value, min, max;
  final ValueChanged<double> onChanged;

  const SliderCard({super.key, required this.label, required this.value, required this.min, required this.max, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          Slider(value: value, min: min, max: max, divisions: ((max - min) ~/ 1), label: value.toStringAsFixed(0), onChanged: onChanged),
        ]),
      ),
    );
  }
}
