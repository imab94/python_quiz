import 'package:flutter/material.dart';
import 'package:python_quiz/widgets/stat_item.dart';

import '../data/all_topics.dart';

class CourseStatsCard extends StatelessWidget {
  const CourseStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalTopics = allTopics.length;
    final int totalLevels =
        allTopics.map((topic) => topic.level).toSet().length;
    final int totalQuizQuestions = allTopics.fold(
      0,
          (sum, topic) => sum + topic.quizQuestions.length,
    );

    const int estimatedMinutesPerTopic = 15;

    final int totalEstimatedMinutes =
        totalTopics * estimatedMinutesPerTopic;

    final int totalHours =
    (totalEstimatedMinutes / 60).ceil();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: .10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: StatItem(
              icon: Icons.menu_book_rounded,
              value: "$totalTopics",
              label: "Topics",
              color: Colors.amber,
            ),
          ),

          _divider(),

          Expanded(
            child: StatItem(
              icon: Icons.quiz_rounded,
              value: "$totalQuizQuestions",
              label: "Questions",
              color: Colors.lightBlueAccent,
            ),
          ),

          _divider(),

          Expanded(
            child: StatItem(
              icon: Icons.layers_rounded,
              value: "$totalLevels",
              label: "Levels",
              color: Colors.greenAccent,
            ),
          ),

          _divider(),

          Expanded(
            child: StatItem(
              icon: Icons.schedule_rounded,
              value: "$totalHours+",
              label: "Hours",
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: Colors.white.withValues(alpha: .10),
    );
  }
}