import 'package:flutter/material.dart';
import 'widgets/gender_card.dart';
import 'widgets/slider_card.dart';
import 'widgets/result_text.dart';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const BMIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  String gender = 'Male';
  double height = 170, weight = 60;
  int age = 25;
  double? bmi;
  String category = '';

  void calculateBMI() {
    bmi = weight / ((height / 100) * (height / 100));
    if (bmi! < 18.5) category = 'Underweight';
    else if (bmi! < 25) category = 'Normal';
    else if (bmi! < 30) category = 'Overweight';
    else category = 'Obese';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [
            Expanded(child: GenderCard(gender: 'Male', selected: gender == 'Male', onTap: () => setState(() => gender = 'Male'))),
            const SizedBox(width: 10),
            Expanded(child: GenderCard(gender: 'Female', selected: gender == 'Female', onTap: () => setState(() => gender = 'Female'))),
          ]),
          const SizedBox(height: 20),
          SliderCard(label: 'Height (cm)', value: height, min: 100, max: 220, onChanged: (v) => setState(() => height = v)),
          const SizedBox(height: 20),
          SliderCard(label: 'Weight (kg)', value: weight, min: 30, max: 150, onChanged: (v) => setState(() => weight = v)),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Age: $age', style: const TextStyle(fontSize: 18)),
            Row(children: [
              IconButton(icon: const Icon(Icons.remove), onPressed: () => setState(() => age = age > 1 ? age - 1 : 1)),
              IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => age++)),
            ]),
          ]),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: calculateBMI, child: const Text('Calculate BMI')),
          const SizedBox(height: 20),
          if (bmi != null) ResultText(bmi: bmi!, category: category, gender: gender, age: age),
        ]),
      ),
    );
  }
}
