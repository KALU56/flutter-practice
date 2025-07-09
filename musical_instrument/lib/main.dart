import 'package:flutter/material.dart';

void main() {
  runApp(const PianoApp());
}

class PianoApp extends StatelessWidget {
  const PianoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano UI',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: PianoKeys(),
          ),
        ),
      ),
    );
  }
}

class PianoKeys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White keys - bottom layer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(7, (index) => WhiteKey()),
        ),
        // Black keys - positioned on top
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlackKey(),
              Spacer(), // No black key between E and F
              BlackKey(),
              BlackKey(),
              Spacer(), // No black key between B and C
              BlackKey(),
              BlackKey(),
              BlackKey(),
            ],
          ),
        ),
      ],
    );
  }
}

class WhiteKey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}

class BlackKey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
