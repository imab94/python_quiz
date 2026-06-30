import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  static const String _key = "quiz_progress";

  /// Save or update one quiz result
  static Future<void> saveQuizResult({
    required String topicTitle,
    required int score,
    required int totalQuestions,
    required List<String> selectedAnswers,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_key);

    Map<String, dynamic> progress = {};

    if (jsonString != null) {
      progress = jsonDecode(jsonString);
    }

    final percentage =
    ((score / totalQuestions) * 100).round();

    progress[topicTitle] = {
      "score": score,
      "totalQuestions": totalQuestions,
      "percentage": percentage,
      "passed": percentage >= 70,
      "selectedAnswers": selectedAnswers,
      "completedAt": DateTime.now().toIso8601String(),
    };

    await prefs.setString(
      _key,
      jsonEncode(progress),
    );
  }

  static Future<int> getCompletedQuizCount() async {
    final quizResults = await getAllQuizResults();
    return quizResults.length;
  }

  /// Returns every quiz result
  static Future<Map<String, dynamic>> getAllQuizResults() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_key);

    if (jsonString == null) {
      return {};
    }

    return Map<String, dynamic>.from(
      jsonDecode(jsonString),
    );
  }

  /// Returns one quiz result
  static Future<Map<String, dynamic>?> getQuizResult(
      String topicTitle,
      ) async {
    final progress = await getAllQuizResults();

    if (!progress.containsKey(topicTitle)) {
      return null;
    }

    return Map<String, dynamic>.from(
      progress[topicTitle],
    );
  }

  /// Has this quiz ever been attempted?
  static Future<bool> hasAttempted(
      String topicTitle,
      ) async {
    final result = await getQuizResult(topicTitle);

    return result != null;
  }
}