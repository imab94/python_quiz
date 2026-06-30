import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicQuizCard extends StatelessWidget {
  const TopicQuizCard({
    super.key,
    required this.questionCount,
    required this.estimatedTime,
    required this.onPressed,
  });

  final int questionCount;
  final String estimatedTime;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.quiz, color: Colors.amber, size: 30),
              const SizedBox(width: 10),
              Text(
                "Practice Time",
                style: GoogleFonts.lato(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            "You've completed this topic.\nNow test your understanding before moving to the next lesson.",
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              const Icon(
                Icons.help_outline,
                color: Colors.lightBlueAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "$questionCount Questions",
                style: GoogleFonts.lato(color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.schedule, color: Colors.greenAccent, size: 18),
              const SizedBox(width: 8),
              Text(estimatedTime, style: GoogleFonts.lato(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start Quiz"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
