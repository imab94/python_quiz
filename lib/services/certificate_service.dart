
import 'package:python_quiz/data/topics.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/profile_service.dart';

class CertificateService {
  static int get totalTopics => allTopics.length;

  /// Required score for the first certificate tier.
  static const double minimumScore = 70.0;

  /// True only when all course requirements are satisfied.
  static Future<bool> isEligible() async {
    final completedTopics = await CompletedService.getCompletedTopics();

    if (completedTopics.length < totalTopics) {
      return false;
    }

    final allQuizzesPassed =
    await QuizProgressService.areAllQuizzesPassed(totalTopics);

    if (!allQuizzesPassed) {
      return false;
    }

    final average = await getAverageScore();

    return average >= minimumScore && average <= 100.0;
  }

  /// Returns the score-based tier.
  ///
  /// Note: This method calculates the tier from the score.
  /// Call isEligible() separately before issuing a certificate.
  static Future<CertificateLevel> getCertificateLevel() async {
    final average = await getAverageScore();

    if (average >= 95.0) {
      return CertificateLevel.gold;
    }

    if (average >= 85.0) {
      return CertificateLevel.silver;
    }

    return CertificateLevel.bronze;
  }

  static Future<double> getAverageScore() async {
    return QuizProgressService.getAveragePercentage();
  }

  /// Stable ID for the learner across Bronze, Silver and Gold.
  ///
  /// Uses the saved profile ID instead of generating a new random ID
  /// whenever a certificate is opened or exported.
  static Future<String> generateCertificateId() async {
    final profile = await ProfileService.getProfile();

    final profileId = profile?.profileId.trim();

    if (profileId == null || profileId.isEmpty) {
      throw StateError(
        'A saved learner profile is required to generate a certificate ID.',
      );
    }

    return 'PY-$profileId';
  }

  /// Builds the certificate using the saved learner profile.
  ///
  /// Ineligible learners receive a watermarked preview.
  static Future<Certificate> generateCertificate({
    required String learnerName,
  }) async {
    final profile = await ProfileService.getProfile();

    final eligible = await isEligible();
    final average = await getAverageScore();

    final completedTopics = await CompletedService.getCompletedTopics();
    final quizzesPassed = await QuizProgressService.getPassedQuizCount();

    final level = await getCertificateLevel();

    // Do not create a certificate ID if no saved profile exists.
    // This keeps the ID tied to the learner's persistent profile.
    final certificateId = await generateCertificateId();

    final learnerDisplayName = profile?.name.trim().isNotEmpty == true
        ? profile!.name
        : learnerName;

    return Certificate(
      learnerName: learnerDisplayName,
      courseName: 'Python Learning Path',
      level: level,
      topicsCompleted: completedTopics.length,
      totalTopics: totalTopics,
      quizzesPassed: quizzesPassed,
      totalQuizzes: totalTopics,
      averageScore: average,
      finalScore: eligible ? average : null,
      issuedDate: DateTime.now(),
      certificateId: certificateId,
      verificationUrl:
      'https://pythonlearningplatform.com/verify/$certificateId',
      directorName: 'Python Learning Platform',
      directorTitle: 'Certification Authority',
      isVerified: eligible,
      isPreview: !eligible,
      organizationName: 'Python Master',
    );
  }
}
