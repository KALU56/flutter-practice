import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
        // 🟨 White keys (with sound)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            35,
            (index) => WhiteKey(noteNumber: index + 1),
          ),
        ),

        // ⬛ Black keys (visual only for now)
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlackKey(),
              Spacer(), // E-F
              BlackKey(),
              BlackKey(),
              Spacer(), // B-C
              BlackKey(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              BlackKey(),
              Spacer(),
              BlackKey(),
              BlackKey(),
              Spacer(),
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
  final int noteNumber;
  const WhiteKey({required this.noteNumber, super.key});

  void playSound() {
    final player = AudioPlayer();
    player.play(AssetSource('sounds/note$noteNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: playSound,
      child: Container(
        width: 20,
        height: 300,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}

class BlackKey extends StatelessWidget {
  const BlackKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
