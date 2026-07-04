import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/certificate.dart';

class CertificateStats extends StatelessWidget {
  const CertificateStats({
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

        Divider(
          color: primaryColor.withValues(alpha: .35),
          thickness: 1.2,
        ),

        const SizedBox(height: 22),

        Wrap(
          spacing: 22,
          runSpacing: 18,
          alignment: WrapAlignment.center,
          children: [

            _statCard(
              Icons.menu_book_rounded,
              "Topics",
              "${certificate.topicsCompleted}/${certificate.totalTopics}",
            ),

            _statCard(
              Icons.quiz_rounded,
              "Topic Quizzes",
              "${certificate.quizzesPassed}/${certificate.totalQuizzes}",
            ),

            _statCard(
              Icons.emoji_events_rounded,
              "Assessment",
              "Passed",
            ),

            _statCard(
              Icons.analytics_rounded,
              "Average",
              "${certificate.averageScore.toStringAsFixed(0)}%",
            ),

            _statCard(
              Icons.workspace_premium,
              "Certificate",
              _certificateLevel(),
            ),
          ],
        ),

        const SizedBox(height: 22),

        Divider(
          color: primaryColor.withValues(alpha: .35),
          thickness: 1.2,
        ),
      ],
    );
  }

  Widget _statCard(
      IconData icon,
      String title,
      String value,
      ) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [

          Icon(
            icon,
            color: primaryColor,
            size: 30,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  String _certificateLevel() {
    switch (certificate.level) {
      case CertificateLevel.gold:
        return "Gold";

      case CertificateLevel.silver:
        return "Silver";

      case CertificateLevel.bronze:
        return "Bronze";
    }
  }
}