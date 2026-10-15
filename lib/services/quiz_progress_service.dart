
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  static const String _key = 'quiz_progress';

  /// Save or update one quiz result.
  ///
  /// Keeps the existing SharedPreferences key and data structure
  /// for compatibility with previously saved quiz results.
  static Future<void> saveQuizResult({
    required String topicTitle,
    required int score,
    required int totalQuestions,
    required List<String> selectedAnswers,
  }) async {
    if (totalQuestions <= 0) {
      throw ArgumentError.value(
        totalQuestions,
        'totalQuestions',
        'Must be greater than zero.',
      );
    }

    if (score < 0 || score > totalQuestions) {
      throw ArgumentError(
        'score must be between zero and totalQuestions.',
      );
    }

    final prefs = await SharedPreferences.getInstance();
    final progress = await getAllQuizResults();

    final exactPercentage = (score / totalQuestions) * 100;
    final percentage = exactPercentage.round();

    progress[topicTitle] = {
      'score': score,
      'totalQuestions': totalQuestions,
      'percentage': percentage,
      'passed': exactPercentage >= 70,
      'selectedAnswers': selectedAnswers,
      'completedAt': DateTime.now().toIso8601String(),
    };

    await prefs.setString(_key, jsonEncode(progress));
  }

  /// Number of topics with a saved quiz result.
  static Future<int> getCompletedQuizCount() async {
    final results = await getAllQuizResults();
    return results.length;
  }

  /// Returns all saved quiz results.
  static Future<Map<String, dynamic>> getAllQuizResults() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null || jsonString.isEmpty) {
      return {};
    }

    final decoded = jsonDecode(jsonString);

    if (decoded is! Map) {
      return {};
    }

    return Map<String, dynamic>.from(decoded);
  }

  /// Returns one saved quiz result.
  static Future<Map<String, dynamic>?> getQuizResult(
      String topicTitle,
      ) async {
    final progress = await getAllQuizResults();
    final result = progress[topicTitle];

    if (result is! Map) {
      return null;
    }

    return Map<String, dynamic>.from(result);
  }

  /// Whether this topic has a saved quiz attempt.
  static Future<bool> hasAttempted(String topicTitle) async {
    return await getQuizResult(topicTitle) != null;
  }

  /// Number of saved quiz results marked as passed.
  static Future<int> getPassedQuizCount() async {
    final quizzes = await getAllQuizResults();

    var count = 0;

    for (final result in quizzes.values) {
      if (result is Map && result['passed'] == true) {
        count++;
      }
    }

    return count;
  }

  /// Average percentage across attempted quizzes only.
  ///
  /// Certificate eligibility is checked separately and requires
  /// all topics completed and all quizzes passed.
  static Future<double> getAveragePercentage() async {
    final quizzes = await getAllQuizResults();

    if (quizzes.isEmpty) {
      return 0.0;
    }

    double totalPercentage = 0.0;
    var validQuizCount = 0;

    for (final result in quizzes.values) {
      if (result is! Map) {
        continue;
      }

      final rawScore = result['score'];
      final rawTotal = result['totalQuestions'];

      if (rawScore is num &&
          rawTotal is num &&
          rawTotal > 0 &&
          rawScore >= 0 &&
          rawScore <= rawTotal) {
        // Use the original score and total for accurate averages.
        totalPercentage += (rawScore / rawTotal) * 100;
        validQuizCount++;
        continue;
      }

      // Backward compatibility for records containing only percentage.
      final rawPercentage = result['percentage'];

      if (rawPercentage is num &&
          rawPercentage >= 0 &&
          rawPercentage <= 100) {
        totalPercentage += rawPercentage.toDouble();
        validQuizCount++;
      }
    }

    if (validQuizCount == 0) {
      return 0.0;
    }

    return totalPercentage / validQuizCount;
  }

  /// True only when there are at least [totalTopics] saved results
  /// and every saved result is marked as passed.
  static Future<bool> areAllQuizzesPassed(int totalTopics) async {
    if (totalTopics <= 0) {
      return false;
    }

    final quizzes = await getAllQuizResults();

    if (quizzes.length != totalTopics) {
      return false;
    }

    for (final result in quizzes.values) {
      if (result is! Map || result['passed'] != true) {
        return false;
      }
    }

    return true;
  }

  /// Remove all saved quiz progress.
  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
