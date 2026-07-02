import 'package:flutter/material.dart';
import 'package:python_quiz/data/achievements.dart';
import 'package:python_quiz/widgets/achievement_popup.dart';
import 'package:python_quiz/services/xp_service.dart';

class AchievementPopupService {
  static Future<void> show(
      BuildContext context,
      String achievementId,
      ) async {
    final achievement = allAchievements.firstWhere(
          (a) => a.id == achievementId,
    );

    // Award XP automatically
    await XPService.addXP(achievement.xp);

    await showAchievementPopup(
      context: context,
      achievement: achievement,
    );
  }
}