import 'package:shared_preferences/shared_preferences.dart';

class ChallengeProgressService {
  static const _passedKey = "challenge_passed";
  static const _failedKey = "challenge_failed";

  static Future<void> saveChallengeResult({
    required bool passed,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (passed) {
      final count = prefs.getInt(_passedKey) ?? 0;
      await prefs.setInt(_passedKey, count + 1);
    } else {
      final count = prefs.getInt(_failedKey) ?? 0;
      await prefs.setInt(_failedKey, count + 1);
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
  }
}
