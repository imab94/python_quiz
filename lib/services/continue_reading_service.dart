import 'package:shared_preferences/shared_preferences.dart';

class ContinueReadingService {
  static const _key = "last_opened_topic";

  static Future<void> saveLastTopic(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, topicTitle);
  }

  static Future<String?> getLastTopic() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  static Future<void> clearLastTopic() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}