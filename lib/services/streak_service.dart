import 'package:shared_preferences/shared_preferences.dart';

class StreakService {
  static const _currentStreakKey = "current_streak";
  static const _bestStreakKey = "best_streak";
  static const _lastStudyDateKey = "last_study_date";

  /// Call this whenever the user completes a learning activity.
  static Future<void> updateStreak() async {
    final prefs = await SharedPreferences.getInstance();

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final lastDateString = prefs.getString(_lastStudyDateKey);

    int currentStreak = prefs.getInt(_currentStreakKey) ?? 0;
    int bestStreak = prefs.getInt(_bestStreakKey) ?? 0;

    // First ever activity
    if (lastDateString == null) {
      currentStreak = 1;

      await prefs.setInt(_currentStreakKey, currentStreak);
      await prefs.setInt(_bestStreakKey, currentStreak);
      await prefs.setString(_lastStudyDateKey, todayDate.toIso8601String());

      return;
    }

    final lastDate = DateTime.parse(lastDateString);
    final lastStudyDate = DateTime(lastDate.year, lastDate.month, lastDate.day);

    final difference = todayDate.difference(lastStudyDate).inDays;

    if (difference == 0) {
      // Already studied today
      return;
    }

    if (difference == 1) {
      currentStreak++;
    } else {
      currentStreak = 1;
    }

    if (currentStreak > bestStreak) {
      bestStreak = currentStreak;
    }

    await prefs.setInt(_currentStreakKey, currentStreak);
    await prefs.setInt(_bestStreakKey, bestStreak);
    await prefs.setString(_lastStudyDateKey, todayDate.toIso8601String());
  }

  static Future<int> getCurrentStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_currentStreakKey) ?? 0;
  }

  static Future<int> getBestStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_bestStreakKey) ?? 0;
  }

  static Future<DateTime?> getLastStudyDate() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString(_lastStudyDateKey);

    if (value == null) return null;

    return DateTime.parse(value);
  }

  static Future<void> resetStreak() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_currentStreakKey);
    await prefs.remove(_bestStreakKey);
    await prefs.remove(_lastStudyDateKey);
  }
}
