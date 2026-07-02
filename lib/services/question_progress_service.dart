import 'package:shared_preferences/shared_preferences.dart';

class QuestionProgressService {
  static const _questionsAnsweredKey = "questions_answered";

  /// Add answered questions to total
  static Future<void> addQuestionsAnswered(int count) async {
    final prefs = await SharedPreferences.getInstance();

    final total =
        prefs.getInt(_questionsAnsweredKey) ?? 0;

    await prefs.setInt(
      _questionsAnsweredKey,
      total + count,
    );
  }

  /// Get total answered questions
  static Future<int> getTotalQuestionsAnswered() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_questionsAnsweredKey) ?? 0;
  }

  /// Reset (for testing)
  static Future<void> resetQuestions() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_questionsAnsweredKey);
  }
}