import 'package:flutter/material.dart';
import 'package:python_quiz/services/achievement_popup_service.dart';
import 'package:python_quiz/services/achievement_service.dart';
import 'package:python_quiz/services/challenge_progress_service.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/xp_service.dart';
import 'package:python_quiz/services/streak_service.dart';
import 'package:python_quiz/services/question_progress_service.dart';

class AchievementManager {
  // ============================================================
  // TOPIC QUIZ ACHIEVEMENTS
  // ============================================================

  static Future<void> onTopicQuizCompleted({
    required BuildContext context,
    required int score,
    required int totalQuestions,
  }) async {
    // =========================
    // XP Rewards
    // =========================

    // Quiz Completed
    await XPService.addXP(10);

    // Quiz Passed
    final passed = score >= (totalQuestions * 0.6).ceil();

    if (passed) {
      await XPService.addXP(10);
    }

    // Perfect Quiz Bonus XP
    if (score == totalQuestions) {
      await XPService.addXP(20);
    }

    // =========================
    // Questions Answered
    // =========================

    await QuestionProgressService.addQuestionsAnswered(
      totalQuestions,
    );

    // =========================
    // Quiz Statistics
    // =========================

    final completedQuizzes = await QuizProgressService.getCompletedQuizCount();

    final totalQuestionsAnswered =
    await QuestionProgressService.getTotalQuestionsAnswered();

    // =========================
    // First Quiz
    // =========================

    if (completedQuizzes >= 1) {
      final unlocked = await AchievementService.unlockAchievement("first_quiz");

      if (unlocked) {
        await AchievementPopupService.show(context, "first_quiz");
      }
    }

    // =========================
    // Quiz Champion (10)
    // =========================

    if (completedQuizzes >= 10) {
      final unlocked = await AchievementService.unlockAchievement(
        "ten_quizzes",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "ten_quizzes");
      }
    }

    // =========================
    // Perfect Score
    // =========================

    if (score == totalQuestions) {
      final unlocked = await AchievementService.unlockAchievement(
        "perfect_score",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "perfect_score");
      }
    }

    // =========================
// Question Milestones
// =========================

// 100 Questions
    if (totalQuestionsAnswered >= 100) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "hundred_questions",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "hundred_questions",
        );
      }
    }

// 1000 Questions
    if (totalQuestionsAnswered >= 1000) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "thousand_questions",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "thousand_questions",
        );
      }
    }
  }

  // ============================================================
  // RANDOM CHALLENGE ACHIEVEMENTS
  // ============================================================

  static Future<void> onRandomChallengeCompleted({
    required BuildContext context,
    required int score,
    required int totalQuestions,
    required String difficulty,
  }) async {
    // =========================
    // XP Rewards
    // =========================

    // Challenge Completed
    await XPService.addXP(20);

    final passed = score >= (totalQuestions * 0.6).ceil();

    // Challenge Passed
    if (passed) {
      await XPService.addXP(20);
    }

    // Perfect Challenge Bonus
    if (score == totalQuestions) {
      await XPService.addXP(20);
    }

    // =========================
    // Questions Answered
    // =========================

    await QuestionProgressService.addQuestionsAnswered(
      totalQuestions,
    );

    // =========================
    // Challenge Statistics
    // =========================

    final completedChallenges =
        await ChallengeProgressService.getCompletedCount();

    final passedChallenges = await ChallengeProgressService.getPassedCount();

    final winStreak = await ChallengeProgressService.getWinStreak();

    final totalQuestionsAnswered =
    await QuestionProgressService.getTotalQuestionsAnswered();

    final challengeDays =
    await ChallengeProgressService.getChallengeDaysCount();

    // =========================
    // First Random Challenge
    // =========================

    if (completedChallenges >= 1) {
      final unlocked = await AchievementService.unlockAchievement(
        "first_random",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "first_random");
      }
    }

    // =========================
    // 5 Challenges
    // =========================

    if (completedChallenges >= 5) {
      final unlocked = await AchievementService.unlockAchievement(
        "five_random",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "five_random");
      }
    }

    // =========================
    // 10 Challenges
    // =========================

    if (completedChallenges >= 10) {
      final unlocked = await AchievementService.unlockAchievement("ten_random");

      if (unlocked) {
        await AchievementPopupService.show(context, "ten_random");
      }
    }

    // =========================
    // 25 Challenges
    // =========================

    if (completedChallenges >= 25) {
      final unlocked = await AchievementService.unlockAchievement(
        "twentyfive_random",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "twentyfive_random");
      }
    }

    // =========================
    // 50 Challenges
    // =========================

    if (completedChallenges >= 50) {
      final unlocked = await AchievementService.unlockAchievement(
        "fifty_random",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "fifty_random");
      }
    }

    // =========================
    // Difficulty Achievements
    // =========================

    if (difficulty == "beginner") {
      final unlocked = await AchievementService.unlockAchievement(
        "beginner_challenger",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "beginner_challenger");
      }
    }

    if (difficulty == "intermediate") {
      final unlocked = await AchievementService.unlockAchievement(
        "intermediate_challenger",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "intermediate_challenger");
      }
    }

    if (difficulty == "advanced") {
      final unlocked = await AchievementService.unlockAchievement(
        "advanced_challenger",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "advanced_challenger");
      }
    }

    if (difficulty == "mixed") {
      final unlocked = await AchievementService.unlockAchievement(
        "mixed_master",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "mixed_master");
      }
    }

    // =========================
    // Question Milestones
    // =========================

    // 100 Questions
    if (totalQuestionsAnswered >= 100) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "hundred_questions",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "hundred_questions",
        );
      }
    }

// 1000 Questions
    if (totalQuestionsAnswered >= 1000) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "thousand_questions",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "thousand_questions",
        );
      }
    }

    // =========================
// Daily Challenge Achievements
// =========================

// Daily Learner
    if (challengeDays >= 1) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "daily_challenge",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "daily_challenge",
        );
      }
    }

// Weekly Challenger
    if (challengeDays >= 7) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "weekly_challenge",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "weekly_challenge",
        );
      }
    }

  // Monthly Master
    if (challengeDays >= 30) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "monthly_challenge",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "monthly_challenge",
        );
      }
    }

    // =========================
    // First Victory
    // =========================

    if (passedChallenges >= 1) {
      final unlocked = await AchievementService.unlockAchievement("first_pass");

      if (unlocked) {
        await AchievementPopupService.show(context, "first_pass");
      }
    }

    // =========================
    // Winning Streak
    // =========================

    if (winStreak >= 3) {
      final unlocked = await AchievementService.unlockAchievement(
        "three_passes",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "three_passes");
      }
    }

    // =========================
    // Perfect Random Challenge
    // =========================

    if (score == totalQuestions) {
      final unlocked = await AchievementService.unlockAchievement(
        "perfect_random",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "perfect_random");
      }
    }

    // =========================
    // Difficulty Master
    // =========================

    final beginner = await ChallengeProgressService.hasCompletedDifficulty(
      "beginner",
    );

    final intermediate = await ChallengeProgressService.hasCompletedDifficulty(
      "intermediate",
    );

    final advanced = await ChallengeProgressService.hasCompletedDifficulty(
      "advanced",
    );

    final mixed = await ChallengeProgressService.hasCompletedDifficulty(
      "mixed",
    );

    if (beginner && intermediate && advanced && mixed) {
      final unlocked = await AchievementService.unlockAchievement(
        "difficulty_master",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "difficulty_master");
      }
    }
  }

  // ============================================================
  // TOPIC COMPLETION ACHIEVEMENTS
  // ============================================================

  static Future<void> onTopicCompleted({required BuildContext context}) async {
    final completedTopics = await CompletedService.getCompletedTopics();

    // =========================
    // First Topic
    // =========================

    if (completedTopics.isNotEmpty) {
      final unlocked = await AchievementService.unlockAchievement(
        "first_topic",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "first_topic");
      }
    }

    // =========================
    // 5 Topics
    // =========================

    if (completedTopics.length >= 5) {
      final unlocked = await AchievementService.unlockAchievement(
        "learning_momentum",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "learning_momentum");
      }
    }

    // =========================
    // 10 Topics
    // =========================

    if (completedTopics.length >= 10) {
      final unlocked = await AchievementService.unlockAchievement("ten_topics");

      if (unlocked) {
        await AchievementPopupService.show(context, "ten_topics");
      }
    }

    // =========================
    // 15 Topics
    // =========================

    if (completedTopics.length >= 15) {
      final unlocked = await AchievementService.unlockAchievement(
        "consistent_learner",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "consistent_learner");
      }
    }

    // =========================
    // 20 Topics
    // =========================

    if (completedTopics.length >= 20) {
      final unlocked = await AchievementService.unlockAchievement(
        "knowledge_builder",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "knowledge_builder");
      }
    }

    // =========================
    // 25 Topics
    // =========================

    if (completedTopics.length >= 25) {
      final unlocked = await AchievementService.unlockAchievement(
        "topic_champion",
      );

      if (unlocked) {
        await AchievementPopupService.show(context, "topic_champion");
      }
    }

    // =========================
    // Python Master
    // =========================
    //
    // Replace 31 if you add/remove learning topics.
    //

    if (completedTopics.length >= 31) {
      final unlocked = await AchievementService.unlockAchievement("all_topics");

      if (unlocked) {
        await AchievementPopupService.show(context, "all_topics");
      }
    }
  }

  // ============================================================
// STREAK ACHIEVEMENTS
// ============================================================

  static Future<void> onStreakUpdated({
    required BuildContext context,
  }) async {

    final currentStreak =
    await StreakService.getCurrentStreak();

    // 3 Day Streak
    if (currentStreak >= 3) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "on_fire",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "on_fire",
        );
      }
    }

    // 7 Day Streak
    if (currentStreak >= 7) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "learning_habit",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "learning_habit",
        );
      }
    }

    // 30 Day Streak
    if (currentStreak >= 30) {
      final unlocked =
      await AchievementService.unlockAchievement(
        "unstoppable",
      );

      if (unlocked) {
        await AchievementPopupService.show(
          context,
          "unstoppable",
        );
      }
    }
  }
}
