import 'dart:math';

import 'package:intl/intl.dart';
import 'package:python_quiz/data/topics.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/services/profile_service.dart';

class CertificateService {

  /// Total learning topics
  static int get totalTopics => allTopics.length;

  /// Has the learner earned the certificate?
  static Future<bool> isEligible() async {

    final completedTopics =
    await CompletedService.getCompletedTopics();

    if (completedTopics.length != totalTopics) {
      return false;
    }

    final quizzesPassed =
    await QuizProgressService.areAllQuizzesPassed(
      totalTopics,
    );

    if (!quizzesPassed) {
      return false;
    }

    final average =
    await QuizProgressService.getAveragePercentage();

    if (average < 70) {
      return false;
    }

    return true;
  }

  static Future<CertificateLevel> getCertificateLevel() async {

    final average =
    await QuizProgressService.getAveragePercentage();

    if (average >= 95) {
      return CertificateLevel.gold;
    }

    if (average >= 85) {
      return CertificateLevel.silver;
    }

    return CertificateLevel.bronze;
  }


  static Future<double> getAverageScore() async {
    return QuizProgressService.getAveragePercentage();
  }


  static Future<String> generateCertificateId() async {
    final level = await getCertificateLevel();

    final levelCode = switch (level) {
      CertificateLevel.gold => "G",
      CertificateLevel.silver => "S",
      CertificateLevel.bronze => "B",
    };

    final date = DateFormat('yyyyMMdd').format(DateTime.now());

    final random = Random.secure();
    final number = (100000 + random.nextInt(900000)).toString();

    return "PY-$levelCode-$date-$number";
  }

  static Future<Certificate> generateCertificate({
    required String learnerName,
  }) async {

    final eligible = await isEligible();

    final completedTopics =
    await CompletedService.getCompletedTopics();

    final quizzesPassed =
    await QuizProgressService.getPassedQuizCount();

    final average =
    await getAverageScore();

    final level =
    await getCertificateLevel();
    final certificateId = await generateCertificateId();

    final profile = await ProfileService.getProfile();

    return Certificate(
      learnerName: profile?.name ?? learnerName,
      courseName: "Python Learning Path",
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
      "https://pythonlearningplatform.com/verify/$certificateId",
      directorName: "Python Learning Platform",
      directorTitle: "Certification Authority",
      isVerified: eligible,
      isPreview: !eligible,
      organizationName: "Python Master"
    );
  }

}
