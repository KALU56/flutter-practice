import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> allCategories = [
    'General Quiz',
    'Development',
    'Health',
    'History',
    'Fact',
    'Business',
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final filteredCategories = allCategories
        .where((category) => category.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Select a Category')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search Categories...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() {
                searchText = value;
              }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return CategoryCard(title: filteredCategories[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
