import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSummaryCard extends StatelessWidget {
  const QuizSummaryCard({
    super.key,
    required this.score,
    required this.total,
    required this.percentage,
    required this.passed,
    required this.formattedDate,
  });

  final int score;
  final int total;
  final int percentage;
  final bool passed;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    final wrong = total - score;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            passed ? Icons.verified : Icons.cancel,
            color: passed ? Colors.greenAccent : Colors.redAccent,
            size: 70,
          ),

          const SizedBox(height: 14),

          Text(
            passed ? "PASSED" : "FAILED",
            style: GoogleFonts.lato(
              color: passed ? Colors.greenAccent : Colors.redAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 22),

          Text(
            "$score / $total",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 46,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "$percentage% Accuracy",
            style: GoogleFonts.lato(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 20),

          Divider(
            color: Colors.white.withValues(alpha: .15),
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _statCard(
                "Correct",
                score.toString(),
                Colors.greenAccent,
              ),
              _statCard(
                "Wrong",
                wrong.toString(),
                Colors.redAccent,
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            "Attempted on",
            style: GoogleFonts.lato(
              color: Colors.white60,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            formattedDate,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(
      String title,
      String value,
      Color color,
      ) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.lato(
              color: color,
              fontSize: 26,
              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}