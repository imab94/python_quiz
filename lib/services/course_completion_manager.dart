import 'package:flutter/material.dart';

import 'package:python_quiz/screens/course_completion_screen.dart';
import 'package:python_quiz/services/certificate_service.dart';
import 'package:python_quiz/services/course_completion_service.dart';
import 'package:python_quiz/services/notification_service.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/profile_service.dart';

class CourseCompletionManager {
  static Future<void> checkCourseCompletion({
    required BuildContext context,
  }) async {

    final eligible =
    await CertificateService.isEligible();

    if (!eligible) {
      return;
    }

    final shouldCelebrate =
    await CourseCompletionService.shouldShowCelebration();

    if (!shouldCelebrate) {
      return;
    }

    final level =
    await CertificateService.getCertificateLevel();

    final average =
    await CertificateService.getAverageScore();

    final topicsCompleted =
    await CompletedService.getCompletedCount();

    final quizzesPassed =
    await QuizProgressService.getPassedQuizCount();

    await NotificationService.addCourseCompletedNotification();

    final learnerName = await ProfileService.getLearnerName();

    if (!context.mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CourseCompletionScreen(
          topicsCompleted: topicsCompleted,
          learnerName: learnerName,
          totalTopics: CertificateService.totalTopics,
          quizzesPassed: quizzesPassed,
          averageScore: average,
          certificateName: level.name.toUpperCase(),
        ),
      ),
    );
  }
}