import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateRequirementCard extends StatelessWidget {
  const CertificateRequirementCard({
    super.key,
    required this.allTopicsCompleted,
    required this.allQuizzesPassed,
    required this.averageScore,
  });

  final bool allTopicsCompleted;
  final bool allQuizzesPassed;
  final double averageScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(22),
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

          Text(
            "Certificate Requirements",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          _requirement(
            completed: allTopicsCompleted,
            text: "Complete all learning topics",
          ),

          const SizedBox(height: 12),

          _requirement(
            completed: allQuizzesPassed,
            text: "Pass all topic quizzes",
          ),

          const SizedBox(height: 12),

          _requirement(
            completed: averageScore >= 70,
            text:
            "Maintain at least 70% average score",
          ),
        ],
      ),
    );
  }

  Widget _requirement({
    required bool completed,
    required String text,
  }) {
    return Row(
      children: [

        Icon(
          completed
              ? Icons.check_circle
              : Icons.cancel,
          color: completed
              ? Colors.greenAccent
              : Colors.redAccent,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            text,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}