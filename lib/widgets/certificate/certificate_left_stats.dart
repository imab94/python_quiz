import 'package:flutter/material.dart';

import '../../models/certificate.dart';
import 'certificate_stat_item.dart';

class CertificateLeftStats extends StatelessWidget {
  const CertificateLeftStats({
    super.key,
    required this.certificate,
    required this.primaryColor,
  });

  final Certificate certificate;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CertificateMiniStat(
          icon: Icons.menu_book_rounded,
          value:
          "${certificate.topicsCompleted}/${certificate.totalTopics}",
          title: "Topics",
          color: primaryColor,
        ),

        const SizedBox(height: 26),

        CertificateMiniStat(
          icon: Icons.quiz_rounded,
          value:
          "${certificate.quizzesPassed}/${certificate.totalQuizzes}",
          title: "Quizzes",
          color: primaryColor,
        ),
      ],
    );
  }
}