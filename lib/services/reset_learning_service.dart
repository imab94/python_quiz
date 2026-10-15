import 'package:python_quiz/services/achievement_service.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/notification_service.dart';
import 'package:python_quiz/services/question_progress_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/streak_service.dart';
import 'package:python_quiz/services/xp_service.dart';
import 'package:python_quiz/services/challenge_progress_service.dart';

class ResetLearningService {
  static Future<void> resetAll() async {

    await XPService.resetXP();

    await CompletedService.reset();

    await QuizProgressService.reset();

    await QuestionProgressService.resetQuestions();

    await AchievementService.resetAchievements();

    await StreakService.resetStreak();

    await NotificationService.clearAll();
    await ChallengeProgressService.resetProgress();
  }
}