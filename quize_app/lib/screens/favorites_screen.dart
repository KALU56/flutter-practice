import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import 'quiz_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Quizzes")),
      body: favorites.isEmpty
          ? const Center(child: Text("You haven't added any favorites yet."))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final title = favorites[index];
                return ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(title),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(category: title),
                      ),
                    );
                  },
                );
              },
            ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
