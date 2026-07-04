import 'package:python_quiz/data/topics.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';

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

    final year = DateTime.now().year;

    final level =
    await getCertificateLevel();

    final levelCode = switch (level) {
      CertificateLevel.gold => "G",
      CertificateLevel.silver => "S",
      CertificateLevel.bronze => "B",
    };

    return "PY-$year-$levelCode-000001";
  }

  static Future<Certificate> generatePreviewCertificate({
    required String learnerName,
  }) async {

    final completedTopics =
    await CompletedService.getCompletedTopics();

    final quizzesPassed =
    await QuizProgressService.getPassedQuizCount();

    final average =
    await getAverageScore();

    final level =
    await getCertificateLevel();

    return Certificate(
      learnerName: learnerName,
      courseName: "Python Learning Path",
      level: level,
      topicsCompleted: completedTopics.length,
      totalTopics: totalTopics,
      quizzesPassed: quizzesPassed,
      totalQuizzes: totalTopics,
      averageScore: average,
      issuedDate: DateTime.now(), // we'll hide this in preview
      certificateId: "PREVIEW",
      directorName: "Arun Bhardwaj",
      directorTitle: "Founder • Python Learning Platform",
      isVerified: false,
      isPreview: true,
    );
  }

  static Future<Certificate> generateCertificate({
    required String learnerName,
  }) async {

    final eligible = await isEligible();

    if (!eligible) {
      throw Exception(
        "Certificate requirements have not been completed.",
      );
    }

    final completedTopics =
    await CompletedService.getCompletedTopics();

    final quizzesPassed =
    await QuizProgressService.getPassedQuizCount();

    final average =
    await getAverageScore();

    final level =
    await getCertificateLevel();

    final certificateId =
    await generateCertificateId();

    return Certificate(
      learnerName: learnerName,
      courseName: "Python Learning Path",
      level: level,
      topicsCompleted: completedTopics.length,
      totalTopics: totalTopics,
      quizzesPassed: quizzesPassed,
      totalQuizzes: totalTopics,
      averageScore: average,
      issuedDate: DateTime.now(),
      certificateId: certificateId,
      directorName: "Arun Bhardwaj",
      directorTitle: "Founder • Python Learning Platform",
      isVerified: true,
      isPreview: false,
    );
  }

}
