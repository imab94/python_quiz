import 'package:python_quiz/models/achievement_progress.dart';
import 'package:python_quiz/services/challenge_progress_service.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/question_progress_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/streak_service.dart';
import 'package:python_quiz/data/achievements.dart';
import 'package:python_quiz/models/achievement.dart';
import 'package:python_quiz/services/achievement_service.dart';

class AchievementProgressService {
  static Future<AchievementProgress> getProgress(String achievementId) async {
    switch (achievementId) {
      case "first_topic":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 1,
        );

      case "learning_momentum":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 5,
        );

      case "ten_topics":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 10,
        );

      case "consistent_learner":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 15,
        );

      case "knowledge_builder":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 20,
        );

      case "topic_champion":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 25,
        );

      case "all_topics":
        return AchievementProgress(
          current: await CompletedService.getCompletedCount(),
          target: 31,
        );

      case "first_quiz":
        return AchievementProgress(
          current: await QuizProgressService.getCompletedQuizCount(),
          target: 1,
        );

      case "ten_quizzes":
        return AchievementProgress(
          current: await QuizProgressService.getCompletedQuizCount(),
          target: 10,
        );

      case "first_random":
        return AchievementProgress(
          current: await ChallengeProgressService.getCompletedCount(),
          target: 1,
        );

      case "five_random":
        return AchievementProgress(
          current: await ChallengeProgressService.getCompletedCount(),
          target: 5,
        );

      case "ten_random":
        return AchievementProgress(
          current: await ChallengeProgressService.getCompletedCount(),
          target: 10,
        );

      case "twentyfive_random":
        return AchievementProgress(
          current: await ChallengeProgressService.getCompletedCount(),
          target: 25,
        );

      case "fifty_random":
        return AchievementProgress(
          current: await ChallengeProgressService.getCompletedCount(),
          target: 50,
        );

      case "three_passes":
        return AchievementProgress(
          current: await ChallengeProgressService.getWinStreak(),
          target: 3,
        );

      case "hundred_questions":
        return AchievementProgress(
          current: await QuestionProgressService.getTotalQuestionsAnswered(),
          target: 100,
        );

      case "thousand_questions":
        return AchievementProgress(
          current: await QuestionProgressService.getTotalQuestionsAnswered(),
          target: 1000,
        );

      case "on_fire":
        return AchievementProgress(
          current: await StreakService.getCurrentStreak(),
          target: 3,
        );

      case "learning_habit":
        return AchievementProgress(
          current: await StreakService.getCurrentStreak(),
          target: 7,
        );

      case "unstoppable":
        return AchievementProgress(
          current: await StreakService.getCurrentStreak(),
          target: 30,
        );

      case "daily_challenge":
        return AchievementProgress(
          current: await ChallengeProgressService.getChallengeDaysCount(),
          target: 1,
        );

      case "weekly_challenge":
        return AchievementProgress(
          current: await ChallengeProgressService.getChallengeDaysCount(),
          target: 7,
        );

      case "monthly_challenge":
        return AchievementProgress(
          current: await ChallengeProgressService.getChallengeDaysCount(),
          target: 30,
        );

      default:
        return const AchievementProgress(current: 0, target: 1);
    }
  }

  static String getProgressLabel(String achievementId) {
    switch (achievementId) {

    // Learning
      case "learning_momentum":
      case "ten_topics":
      case "consistent_learner":
      case "knowledge_builder":
      case "topic_champion":
      case "all_topics":
        return "Topics";

    // Topic Quiz
      case "ten_quizzes":
        return "Quizzes";

    // Random Challenge
      case "five_random":
      case "ten_random":
      case "twentyfive_random":
      case "fifty_random":
        return "Challenges";

    // Question Milestones
      case "hundred_questions":
      case "thousand_questions":
        return "Questions";

    // Learning Streak
      case "on_fire":
      case "learning_habit":
      case "unstoppable":
        return "Days";

    // Daily Challenge
      case "weekly_challenge":
      case "monthly_challenge":
        return "Days";

    // Winning Streak
      case "three_passes":
        return "Wins";

      default:
        return "";
    }
  }

  static Future<Achievement?> getNextAchievement() async {
    final unlocked =
    await AchievementService.getUnlockedAchievements();

    for (final achievement in allAchievements) {
      if (!unlocked.contains(achievement.id)) {
        return achievement;
      }
    }

    return null;
  }

  static Future<AchievementProgress?> getNextAchievementProgress() async {
    final achievement = await getNextAchievement();

    if (achievement == null) {
      return null;
    }

    return getProgress(achievement.id);
  }
}
