import 'package:shared_preferences/shared_preferences.dart';

class QuizNotificationService {
  static const _key = "quiz_pass_notifications";

  static Future<bool> shouldNotify(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();

    final notified = prefs.getStringList(_key) ?? [];

    if (notified.contains(topicTitle)) {
      return false;
    }

    notified.add(topicTitle);

    await prefs.setStringList(_key, notified);

    return true;
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}