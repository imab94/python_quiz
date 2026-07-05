enum CertificateLevel {
  bronze,
  silver,
  gold,
}

class Certificate {
  /// Learner
  final String learnerName;
  /// Course
  final String courseName;
  /// Bronze / Silver / Gold
  final CertificateLevel level;
  /// Completion statistics
  final int topicsCompleted;
  final int totalTopics;
  final int quizzesPassed;
  final int totalQuizzes;
  final double averageScore;
  final double? finalScore;
  /// Certificate information
  final DateTime issuedDate;
  final String certificateId;
  /// Verification
  final bool isVerified;
  final bool isPreview;
  /// Organization
  final String organizationName;
  final String directorName;
  final String directorTitle;
  /// Verification URL (future QR code)
  final String? verificationUrl;

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
    this.finalScore,
    required this.certificateId,
    required this.isVerified,
    required this.isPreview,
    required this.organizationName,
    required this.directorName,
    required this.directorTitle,
    this.verificationUrl,
  });

  Certificate copyWith({
    String? learnerName,
    String? courseName,
    CertificateLevel? level,
    int? topicsCompleted,
    int? totalTopics,
    int? quizzesPassed,
    int? totalQuizzes,
    double? averageScore,
    DateTime? issuedDate,
    String? certificateId,
    bool? isVerified,
    bool? isPreview,
    String? organizationName,
    String? directorName,
    String? directorTitle,
    String? verificationUrl,
    double? finalScore,
  }) {
    return Certificate(
      learnerName: learnerName ?? this.learnerName,
      courseName: courseName ?? this.courseName,
      level: level ?? this.level,
      topicsCompleted: topicsCompleted ?? this.topicsCompleted,
      totalTopics: totalTopics ?? this.totalTopics,
      quizzesPassed: quizzesPassed ?? this.quizzesPassed,
      totalQuizzes: totalQuizzes ?? this.totalQuizzes,
      averageScore: averageScore ?? this.averageScore,
      finalScore: finalScore ?? this.finalScore,
      issuedDate: issuedDate ?? this.issuedDate,
      certificateId: certificateId ?? this.certificateId,
      isVerified: isVerified ?? this.isVerified,
      isPreview: isPreview ?? this.isPreview,
      organizationName: organizationName ?? this.organizationName,
      directorName: directorName ?? this.directorName,
      directorTitle: directorTitle ?? this.directorTitle,
      verificationUrl: verificationUrl ?? this.verificationUrl,
    );
  }
}