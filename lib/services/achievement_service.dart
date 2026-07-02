import 'package:shared_preferences/shared_preferences.dart';

class AchievementService {
  static const String _key = "unlocked_achievements";

  /// Returns all unlocked achievement IDs
  static Future<List<String>> getUnlockedAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_key) ?? [];
  }

  /// Unlocks an achievement.
  /// Returns true if it was unlocked for the first time.
  /// Returns false if it was already unlocked.
  static Future<bool> unlockAchievement(String id) async {
    final prefs = await SharedPreferences.getInstance();

    final achievements =
        prefs.getStringList(_key) ?? <String>[];

    if (achievements.contains(id)) {
      return false;
    }

    achievements.add(id);

    await prefs.setStringList(_key, achievements);

    return true;
  }

  /// Checks whether an achievement is already unlocked.
  static Future<bool> isUnlocked(String id) async {
    final achievements = await getUnlockedAchievements();

    return achievements.contains(id);
  }

  /// Number of unlocked achievements.
  static Future<int> getUnlockedCount() async {
    final achievements = await getUnlockedAchievements();

    return achievements.length;
  }

  /// Clears all achievements.
  /// Useful during development/testing.
  static Future<void> resetAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }
}