import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _key = "favorite_topics";
  /// Returns all favorite topic titles.
  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_key) ?? [];
  }

  /// Returns true if topic is favorite.
  static Future<bool> isFavorite(String topicTitle) async {
    final favorites = await getFavorites();
    return favorites.contains(topicTitle);
  }

  /// Add topic.
  static Future<void> addFavorite(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();

    final favorites = prefs.getStringList(_key) ?? [];

    if (!favorites.contains(topicTitle)) {
      favorites.add(topicTitle);
      await prefs.setStringList(_key, favorites);
    }
  }

  /// Remove topic.
  static Future<void> removeFavorite(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();

    final favorites = prefs.getStringList(_key) ?? [];

    favorites.remove(topicTitle);

    await prefs.setStringList(_key, favorites);
  }

  /// Toggle favorite.
  static Future<bool> toggleFavorite(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();

    final favorites = prefs.getStringList(_key) ?? [];

    if (favorites.contains(topicTitle)) {
      favorites.remove(topicTitle);
      await prefs.setStringList(_key, favorites);
      return false;
    }

    favorites.add(topicTitle);
    await prefs.setStringList(_key, favorites);

    return true;
  }
}
