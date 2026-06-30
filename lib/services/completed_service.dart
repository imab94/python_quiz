import 'package:shared_preferences/shared_preferences.dart';

class CompletedService {
  static const _key = "completed_topics";

  static Future<List<String>> getCompletedTopics() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<bool> isCompleted(String topicTitle) async {
    final completed = await getCompletedTopics();
    return completed.contains(topicTitle);
  }

  static Future<void> markCompleted(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();

    final completed = prefs.getStringList(_key) ?? [];

    if (!completed.contains(topicTitle)) {
      completed.add(topicTitle);
      await prefs.setStringList(_key, completed);
    }
  }

  static Future<void> removeCompleted(String topicTitle) async {
    final prefs = await SharedPreferences.getInstance();

    final completed = prefs.getStringList(_key) ?? [];

    completed.remove(topicTitle);

    await prefs.setStringList(_key, completed);
  }

  static Future<int> getCompletedCount() async {
    final completed = await getCompletedTopics();
    return completed.length;
  }

  static Future<double> getCompletionPercentage(int totalTopics) async {
    final completed = await getCompletedTopics();

    if (totalTopics == 0) return 0;

    return completed.length / totalTopics;
  }
}