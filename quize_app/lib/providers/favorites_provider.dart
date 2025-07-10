import 'package:flutter/foundation.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favorites = {};

  Set<String> get favorites => _favorites;

  void toggleFavorite(String title) {
    if (_favorites.contains(title)) {
      _favorites.remove(title);
    } else {
      _favorites.add(title);
    }
    notifyListeners(); // tells widgets to rebuild
  }

  bool isFavorite(String title) => _favorites.contains(title);
}
