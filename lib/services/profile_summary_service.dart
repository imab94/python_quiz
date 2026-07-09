import 'package:python_quiz/models/profile_summary.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/streak_service.dart';
import 'package:python_quiz/services/xp_service.dart';

import 'achievement_service.dart';
import 'certificate_service.dart';
import 'completed_service.dart';

class ProfileSummaryService {

  static Future<ProfileSummary> load() async {

    final totalXp = await XPService.getTotalXP();

    final hasCertificate =
    await CertificateService.isEligible();

    String certificateName = "Locked";

    if (hasCertificate) {

      final level =
      await CertificateService.getCertificateLevel();

      certificateName =
      "${level.name[0].toUpperCase()}${level.name.substring(1)}";
    }

    final achievementCount =
    await AchievementService.getUnlockedCount();

    final streakDay =
    await StreakService.getCurrentStreak();

    final completedTopics = await  CompletedService.getCompletedCount();
    final totalTopics = CertificateService.totalTopics;
    final passedQuizzes = await QuizProgressService.getPassedQuizCount();
    final totalQuizzes =  CertificateService.totalTopics;
    final averageScore = await QuizProgressService.getAveragePercentage();

    return ProfileSummary(
      totalXp: totalXp,
      dayStreak: streakDay,
      achievementCount: achievementCount,
      completedTopics: completedTopics,
      totalTopics: totalTopics,
      passedQuizzes: passedQuizzes,
      totalQuizzes: totalQuizzes,
      averageScore: averageScore,
      certificateName: certificateName,
      hasCertificate: hasCertificate,
    );
  }
}