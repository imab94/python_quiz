import 'package:shared_preferences/shared_preferences.dart';

class RandomChallengeNotificationService {
  static const _key = "random_challenge_notifications";

  static Future<bool> shouldNotify(String difficulty) async {
    final prefs = await SharedPreferences.getInstance();

    final notified = prefs.getStringList(_key) ?? [];

    if (notified.contains(difficulty)) {
      return false;
    }

    notified.add(difficulty);

    await prefs.setStringList(_key, notified);

    return true;
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }
}