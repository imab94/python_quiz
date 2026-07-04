enum CertificateLevel {
  bronze,
  silver,
  gold,
}

class Certificate {
  final String learnerName;
  final CertificateLevel level;
  final String courseName;
  final int topicsCompleted;
  final int totalTopics;
  final int quizzesPassed;
  final int totalQuizzes;
  final double averageScore;
  final DateTime issuedDate;
  final String certificateId;
  final String directorName;
  final String directorTitle;
  final bool isVerified;
  final bool isPreview;

  const Certificate({
    required this.learnerName,
    required this.courseName,
    required this.level,
    required this.topicsCompleted,
    required this.totalTopics,
    required this.quizzesPassed,
    required this.totalQuizzes,
    required this.averageScore,
    required this.issuedDate,
    required this.certificateId,
    required this.directorName,
    required this.directorTitle,
    required this.isVerified,
    required this.isPreview,
  });
}