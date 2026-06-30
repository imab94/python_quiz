import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/widgets/stat_item.dart';

import '../data/all_topics.dart';

class CourseStatsCard extends StatelessWidget {
  const CourseStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalTopics = allTopics.length;
    final int totalQuizQuestions = allTopics.fold(0,
          (sum, topic) => sum + topic.quizQuestions.length,
    );
    final int totalLevels = allTopics.map((t) => t.level).toSet().length;

    final totalMinutes = totalTopics * 15;

    final totalHours = (totalMinutes / 60).ceil();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Course Overview",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Everything you need to become a Python developer.",
            style: GoogleFonts.lato(color: Colors.white70, fontSize: 15),
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              StatItem(
                icon: Icons.menu_book_rounded,
                value: "$totalTopics+",
                label: "Topics",
                color: Colors.amber,
              ),
               StatItem(
                icon: Icons.quiz_rounded,
                value: "$totalQuizQuestions+",
                label: "Questions",
                color: Colors.lightBlueAccent,
              ),
            ],
          ),

          SizedBox(height: 24),

          Row(
            children: [
              StatItem(
                icon: Icons.layers_rounded,
                value: "$totalLevels",
                label: "Levels",
                color: Colors.greenAccent,
              ),
               StatItem(
                icon: Icons.schedule_rounded,
                value: "$totalHours+",
                label: "Hours",
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
