import 'package:flutter/material.dart';

class BaseResult extends StatelessWidget {
  final String text;
  const BaseResult({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center);
  }
}

class ResultText extends BaseResult {
  ResultText({required double bmi, required String category, required String gender, required int age})
      : super(text: 'Gender: $gender • Age: $age\nBMI: ${bmi.toStringAsFixed(1)} ($category)');
}
