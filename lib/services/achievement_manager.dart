import 'package:flutter/material.dart';
import 'package:python_quiz/services/achievement_popup_service.dart';
import 'package:python_quiz/services/achievement_service.dart';
import 'package:python_quiz/services/challenge_progress_service.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/xp_service.dart';
import 'package:python_quiz/services/streak_service.dart';
import 'package:python_quiz/services/question_progress_service.dart';
import 'package:python_quiz/data/achievements.dart';

import 'notification_service.dart';

class AchievementManager {

  static Future<void> _unlockAchievement({
    required BuildContext context,
    required String achievementId,
  }) async {
    final unlocked =
    await AchievementService.unlockAchievement(
      achievementId,
    );

    if (!unlocked) return;

    final achievement = allAchievements.where(
          (a) => a.id == achievementId,
    ).firstOrNull;

    if (achievement == null) {
      return;
    }

    await NotificationService
        .addAchievementUnlockedNotification(
      achievementId: achievement.id,
      achievementName: achievement.title,
    );

    await AchievementPopupService.show(
      context,
      achievementId,
    );
  }

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
    await XPService.addActivityXP(10);

    // Quiz Passed
    final passed = score >= (totalQuestions * 0.6).ceil();

    if (passed) {
      await XPService.addActivityXP(10);
    }

    // Perfect Quiz Bonus XP
    if (score == totalQuestions) {
      await XPService.addActivityXP(10);
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
      await _unlockAchievement(
        context: context,
        achievementId: "first_quiz",
      );
    }

    // =========================
    // Quiz Champion (10)
    // =========================

    if (completedQuizzes >= 10) {
      await _unlockAchievement(
        context: context,
        achievementId: "ten_quizzes",
      );
    }

    // =========================
    // Perfect Score
    // =========================

    if (score == totalQuestions) {
      await _unlockAchievement(
        context: context,
        achievementId: "perfect_score",

      );
    }

    // =========================
    // Question Milestones
    // =========================
    // 100 Questions
    if (totalQuestionsAnswered >= 100) {
      await _unlockAchievement(
        context: context,
        achievementId: "hundred_questions",
      );
    }

  // 1000 Questions
    if (totalQuestionsAnswered >= 1000) {
      await _unlockAchievement(
        context: context,
        achievementId: "thousand_questions",
      );
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
    await XPService.addActivityXP(15);

    final passed = score >= (totalQuestions * 0.6).ceil();

    // Challenge Passed
    if (passed) {
      await XPService.addActivityXP(15);
    }

    // Perfect Challenge Bonus
    if (score == totalQuestions) {
      await XPService.addActivityXP(10);
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
      await _unlockAchievement(
        context: context,
        achievementId: "first_random",
      );
    }
    // =========================
    // 5 Challenges
    // =========================
    if (completedChallenges >= 5) {
      await _unlockAchievement(
        context: context,
        achievementId: "five_random",
      );
    }
    // =========================
    // 10 Challenges
    // =========================

    if (completedChallenges >= 10) {
      await _unlockAchievement(
        context: context,
        achievementId: "ten_random",
      );
    }

    // =========================
    // 25 Challenges
    // =========================

    if (completedChallenges >= 25) {
      await _unlockAchievement(
        context: context,
        achievementId: "twentyfive_random",
      );
    }

    // =========================
    // 50 Challenges
    // =========================

    if (completedChallenges >= 50) {
      await _unlockAchievement(
        context: context,
        achievementId: "fifty_random",
      );
    }

    // =========================
    // Difficulty Achievements
    // =========================

    if (difficulty == "beginner") {
      await _unlockAchievement(
        context: context,
        achievementId: "beginner_challenger",
      );
    }

    if (difficulty == "intermediate") {
      await _unlockAchievement(
        context: context,
        achievementId: "intermediate_challenger",
      );
    }

    if (difficulty == "advanced") {
      await _unlockAchievement(
        context: context,
        achievementId: "advanced_challenger",
      );
    }

    if (difficulty == "mixed") {
      await _unlockAchievement(
        context: context,
        achievementId: "mixed_master",
      );
    }

    // =========================
    // Question Milestones
    // =========================

    // 100 Questions
    if (totalQuestionsAnswered >= 100) {
      await _unlockAchievement(
        context: context,
        achievementId: "hundred_questions",
      );
    }

// 1000 Questions
    if (totalQuestionsAnswered >= 1000) {
      await _unlockAchievement(
        context: context,
        achievementId: "thousand_questions",
      );
    }

    // =========================
// Daily Challenge Achievements
// =========================

// Daily Learner
    if (challengeDays >= 1) {
      await _unlockAchievement(
        context: context,
        achievementId: "daily_challenge",
      );
    }

// Weekly Challenger
    if (challengeDays >= 7) {
      await _unlockAchievement(
        context: context,
        achievementId: "weekly_challenge",
      );
    }

  // Monthly Master
    if (challengeDays >= 30) {
      await _unlockAchievement(
        context: context,
        achievementId: "monthly_challenge",
      );
    }

    // =========================
    // First Victory
    // =========================

    if (passedChallenges >= 1) {
      await _unlockAchievement(
        context: context,
        achievementId: "first_pass",
      );
    }

    // =========================
    // Winning Streak
    // =========================

    if (winStreak >= 3) {
      await _unlockAchievement(
        context: context,
        achievementId: "three_passes",
      );
    }

    // =========================
    // Perfect Random Challenge
    // =========================

    if (score == totalQuestions) {
      await _unlockAchievement(
        context: context,
        achievementId: "perfect_random",
      );
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
      await _unlockAchievement(
        context: context,
        achievementId: "difficulty_master",
      );
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
      await _unlockAchievement(
        context: context,
        achievementId: "first_topic",
      );
    }

    // =========================
    // 5 Topics
    // =========================

    if (completedTopics.length >= 5) {
      await _unlockAchievement(
        context: context,
        achievementId: "learning_momentum",
      );
    }

    // =========================
    // 10 Topics
    // =========================

    if (completedTopics.length >= 10) {
      await _unlockAchievement(
        context: context,
        achievementId: "ten_topics",
      );
    }

    // =========================
    // 15 Topics
    // =========================

    if (completedTopics.length >= 15) {
      await _unlockAchievement(
        context: context,
        achievementId: "consistent_learner",
      );
    }

    // =========================
    // 20 Topics
    // =========================

    if (completedTopics.length >= 20) {
      await _unlockAchievement(
        context: context,
        achievementId: "knowledge_builder",
      );
    }

    // =========================
    // 25 Topics
    // =========================

    if (completedTopics.length >= 25) {
      await _unlockAchievement(
        context: context,
        achievementId: "topic_champion",
      );
    }

    // =========================
    // Python Master
    // =========================
    //
    // Replace 31 if you add/remove learning topics.
    //

    if (completedTopics.length >= 31) {
      await _unlockAchievement(
        context: context,
        achievementId: "all_topics",
      );
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
      await _unlockAchievement(
        context: context,
        achievementId: "on_fire",
      );
    }

    // 7 Day Streak
    if (currentStreak >= 7) {
      await _unlockAchievement(
        context: context,
        achievementId: "learning_habit",
      );
    }

    // 30 Day Streak
    if (currentStreak >= 30) {
      await _unlockAchievement(
        context: context,
        achievementId: "unstoppable",
      );
    }
  }
}
