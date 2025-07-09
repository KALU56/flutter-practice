import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller Without Images',
      home: const DicePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  void rollDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roller Without Images'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: DiceFace(number: leftDice)),
            const SizedBox(width: 20),
            Expanded(child: DiceFace(number: rightDice)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: rollDice,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.casino),
        tooltip: 'Roll Dice',
      ),
    );
  }
}

// This widget draws dots on a square container based on the dice number
class DiceFace extends StatelessWidget {
  final int number;
  const DiceFace({super.key, required this.number});

  Widget buildDot() {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dice face is a 3x3 grid of dots
    // We'll decide which dots to show based on dice number
    // Positions are numbered like this:
    // [0] [1] [2]
    // [3] [4] [5]
    // [6] [7] [8]

    // This map tells which positions to show for each dice number
    final dotPositions = <int, List<int>>{
      1: [4],
      2: [0, 8],
      3: [0, 4, 8],
      4: [0, 2, 6, 8],
      5: [0, 2, 4, 6, 8],
      6: [0, 2, 3, 5, 6, 8],
    };

    List<Widget> dots = List.generate(9, (index) {
      return Center(
        child: dotPositions[number]!.contains(index) ? buildDot() : Container(),
      );
    });

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(3, 3),
              blurRadius: 5,
            )
          ],
        ),
        child: GridView.count(
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          children: dots,
        ),
      ),
    );
  }
}
