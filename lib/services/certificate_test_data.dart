
import 'package:python_quiz/data/topics.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';

class CertificateTestData {
  /// Creates local test progress for Bronze certificate testing.
  /// WARNING: This updates existing quiz results for matching topic titles.
  static Future<void> seedBronzeTestData() async {
    for (final topic in allTopics) {
      // Adjust topic.title if your topic model uses another field.
      final topicTitle = topic.title;

      await QuizProgressService.saveQuizResult(
        topicTitle: topicTitle,
        score: 8,
        totalQuestions: 10,
        selectedAnswers: List<String>.filled(10, 'TEST'),
      );

      await CompletedService.markCompleted(topicTitle);
    }
  }

  /// Clears all quiz results and completed-topic records.
  /// WARNING: This also deletes genuine saved progress.
  static Future<void> clearAllProgress() async {
    await QuizProgressService.reset();
    await CompletedService.reset();
  }
}
