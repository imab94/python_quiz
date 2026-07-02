import 'package:shared_preferences/shared_preferences.dart';

class ChallengeProgressService {
  static const _passedKey = "challenge_passed";
  static const _failedKey = "challenge_failed";

  static const _completedKey = "challenge_completed";
  static const _winStreakKey = "challenge_win_streak";

  static const _beginnerKey = "beginner_completed";
  static const _intermediateKey = "intermediate_completed";
  static const _advancedKey = "advanced_completed";
  static const _mixedKey = "mixed_completed";

  static const _challengeDatesKey = "challenge_dates";

  static Future<void> saveChallengeResult({
    required bool passed,
    required String difficulty
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // Total Challenges
    final completed = prefs.getInt(_completedKey) ?? 0;
    await prefs.setInt(
      _completedKey,
      completed + 1,
    );

    if (passed) {
      final passedCount =
          prefs.getInt(_passedKey) ?? 0;

      await prefs.setInt(
        _passedKey,
        passedCount + 1,
      );

      // Consecutive wins
      final streak =
          prefs.getInt(_winStreakKey) ?? 0;

      await prefs.setInt(
        _winStreakKey,
        streak + 1,
      );
    } else {
      final failedCount =
          prefs.getInt(_failedKey) ?? 0;

      await prefs.setInt(
        _failedKey,
        failedCount + 1,
      );

      // Reset consecutive wins
      await prefs.setInt(
        _winStreakKey,
        0,
      );
    }
    switch (difficulty) {
      case "beginner":
        await prefs.setBool(_beginnerKey, true);
        break;

      case "intermediate":
        await prefs.setBool(_intermediateKey, true);
        break;

      case "advanced":
        await prefs.setBool(_advancedKey, true);
        break;

      case "mixed":
        await prefs.setBool(_mixedKey, true);
        break;
    }

    // Save today's challenge date

    final today =
        DateTime.now().toIso8601String().split("T").first;

    final dates =
        prefs.getStringList(_challengeDatesKey) ?? [];

    if (!dates.contains(today)) {
      dates.add(today);

      await prefs.setStringList(
        _challengeDatesKey,
        dates,
      );
    }
  }

  static Future<int> getCompletedCount() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_completedKey) ?? 0;
  }

  static Future<int> getChallengeDaysCount() async {
    final prefs = await SharedPreferences.getInstance();

    final dates =
        prefs.getStringList(_challengeDatesKey) ?? [];

    return dates.length;
  }

  static Future<int> getWinStreak() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_winStreakKey) ?? 0;
  }


// 👇 Add here
  static Future<bool> hasCompletedDifficulty(
      String difficulty,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    switch (difficulty) {
      case "beginner":
        return prefs.getBool(_beginnerKey) ?? false;

      case "intermediate":
        return prefs.getBool(_intermediateKey) ?? false;

      case "advanced":
        return prefs.getBool(_advancedKey) ?? false;

      case "mixed":
        return prefs.getBool(_mixedKey) ?? false;

      default:
        return false;
    }
  }


  static Future<int> getPassedCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_passedKey) ?? 0;
  }

  static Future<int> getFailedCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_failedKey) ?? 0;
  }

  static Future<void> resetProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_passedKey);
    await prefs.remove(_failedKey);
    await prefs.remove(_completedKey);
    await prefs.remove(_winStreakKey);
    await prefs.remove(_beginnerKey);
    await prefs.remove(_intermediateKey);
    await prefs.remove(_advancedKey);
    await prefs.remove(_mixedKey);
    await prefs.remove(_challengeDatesKey);
  }
}
