import 'package:flutter/material.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

import '../components/stat_card.dart';
import '../components/certificate_medal.dart';
import '../components/certificate_qr.dart';

class CertificateStats extends StatelessWidget {
  const CertificateStats({
    super.key,
    required this.certificate,
    required this.theme,
  });

  final Certificate certificate;
  final CertificateThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Expanded(
          child: StatCard(
            title: "Topics",
            value:
            "${certificate.topicsCompleted}/${certificate.totalTopics}",
            icon: Icons.menu_book_rounded,
            theme: theme,
          ),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: StatCard(
            title: "Quizzes",
            value:
            "${certificate.quizzesPassed}/${certificate.totalQuizzes}",
            icon: Icons.quiz_rounded,
            theme: theme,
          ),
        ),

        const SizedBox(width: 22),

        CertificateMedal(
          level: certificate.level,
        ),

        const SizedBox(width: 22),

          StatCard(
            title: "Average",
            value:
            "${certificate.averageScore.toStringAsFixed(1)}%",
            icon: Icons.bar_chart_rounded,
            theme: theme,
          ),

        const SizedBox(width: 18),

        CertificateQr(
          certificate: certificate,
        ),
      ],
    );
  }
}