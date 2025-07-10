import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final bool selected;
  final VoidCallback onTap;

  const GenderCard({super.key, required this.gender, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    IconData icon = gender == 'Male' ? Icons.male : Icons.female;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: selected ? Colors.teal.shade100 : Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, size: 48, color: Colors.teal),
            const SizedBox(height: 8),
            Text(gender, style: const TextStyle(fontSize: 18)),
          ]),
        ),
      ),
    );
  }
}
