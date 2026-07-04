import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/certificate.dart';

class CertificateProgressCard extends StatelessWidget {
  const CertificateProgressCard({
    super.key,
    required this.completedTopics,
    required this.totalTopics,
    required this.passedQuizzes,
    required this.averageScore,
    required this.level,
    required this.isEligible,
  });

  final int completedTopics;
  final int totalTopics;
  final int passedQuizzes;
  final double averageScore;
  final CertificateLevel level;
  final bool isEligible;

  @override
  Widget build(BuildContext context) {

    final progress =
        completedTopics / totalTopics;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white24,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Icon(
                isEligible
                    ? Icons.verified
                    : Icons.lock_outline,
                color: isEligible
                    ? Colors.greenAccent
                    : Colors.orangeAccent,
              ),

              const SizedBox(width: 10),

              Text(
                isEligible
                    ? "Certificate Unlocked"
                    : "Certificate Locked",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            "$completedTopics / $totalTopics Topics Completed",
            style: GoogleFonts.lato(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.white12,
              valueColor:
              const AlwaysStoppedAnimation(
                Colors.greenAccent,
              ),
            ),
          ),

          const SizedBox(height: 22),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [

              _item(
                "Quizzes",
                passedQuizzes.toString(),
                Icons.quiz_rounded,
              ),

              _item(
                "Average",
                "${averageScore.toStringAsFixed(1)}%",
                Icons.analytics_outlined,
              ),

              _item(
                "Level",
                level.name.toUpperCase(),
                Icons.workspace_premium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(
      String title,
      String value,
      IconData icon,
      ) {
    return Column(
      children: [

        Icon(
          icon,
          color: Colors.amber,
        ),

        const SizedBox(height: 8),

        Text(
          value,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}