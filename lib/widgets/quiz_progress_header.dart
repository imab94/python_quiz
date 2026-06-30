import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizProgressHeader extends StatelessWidget {
  const QuizProgressHeader({
    super.key,
    required this.totalTopics,
    required this.attemptedTopics,
    required this.passedTopics,
  });

  final int totalTopics;
  final int attemptedTopics;
  final int passedTopics;

  @override
  Widget build(BuildContext context) {
    final failedTopics = attemptedTopics - passedTopics;

    final progress =
    totalTopics == 0 ? 0.0 : attemptedTopics / totalTopics;

    return Container(
      margin: const EdgeInsets.fromLTRB(18, 18, 18, 22),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: .08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Quiz Progress",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "$attemptedTopics of $totalTopics topic quizzes attempted",
            style: GoogleFonts.lato(
              color: Colors.white60,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 22),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.white12,
              color: Colors.greenAccent,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              _stat(
                "Attempted",
                attemptedTopics.toString(),
                Colors.amber,
              ),

              _stat(
                "Passed",
                passedTopics.toString(),
                Colors.greenAccent,
              ),

              _stat(
                "Failed",
                failedTopics.toString(),
                Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(
      String title,
      String value,
      Color color,
      ) {
    return Column(
      children: [

        Text(
          value,
          style: GoogleFonts.lato(
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}