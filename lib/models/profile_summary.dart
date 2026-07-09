class ProfileSummary {
  const ProfileSummary({
    required this.totalXp,
    required this.dayStreak,
    required this.achievementCount,
    required this.completedTopics,
    required this.totalTopics,
    required this.passedQuizzes,
    required this.totalQuizzes,
    required this.averageScore,
    required this.certificateName,
    required this.hasCertificate,
  });

  final int totalXp;

  final int dayStreak;

  final int achievementCount;

  final int completedTopics;
  final int totalTopics;

  final int passedQuizzes;
  final int totalQuizzes;

  final double averageScore;

  final String certificateName;

  final bool hasCertificate;
}