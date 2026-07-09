import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/profile_summary.dart';

class ProfileLearningProgress extends StatelessWidget {
  const ProfileLearningProgress({
    super.key,
    required this.summary,
  });

  final ProfileSummary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        8,
        24,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Learning Progress",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.white12,
              ),
            ),
            child: Column(
              children: [

                _buildProgressItem(
                  icon: Icons.menu_book_rounded,
                  title: "Topics Completed",
                  value:
                  "${summary.completedTopics} / ${summary.totalTopics}",
                  progress: summary.totalTopics == 0
                      ? 0
                      : summary.completedTopics /
                      summary.totalTopics,
                ),
                const SizedBox(height: 22),
                _buildProgressItem(
                  icon: Icons.quiz_rounded,
                  title: "Quizzes Passed",
                  value:
                  "${summary.passedQuizzes} / ${summary.totalQuizzes}",
                  progress: summary.totalQuizzes == 0
                      ? 0
                      : summary.passedQuizzes /
                      summary.totalQuizzes,
                ),
                const SizedBox(height: 22),
                _buildProgressItem(
                  icon: Icons.trending_up_rounded,
                  title: "Overall Progress",
                  value: "${(_overallProgress * 100).toStringAsFixed(0)}%",
                  progress: _overallProgress,
                ),
                const SizedBox(height: 22),
                _buildProgressItem(
                  icon: Icons.track_changes_rounded,
                  title: "Course Average",
                  value:
                  "${summary.averageScore.toStringAsFixed(1)}%",
                  progress: summary.averageScore / 100,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

  double get _overallProgress {
    if (summary.totalTopics == 0 ||
        summary.totalQuizzes == 0) {
      return 0;
    }

    final topics =
        summary.completedTopics / summary.totalTopics;

    final quizzes =
        summary.passedQuizzes / summary.totalQuizzes;

    return (topics + quizzes) / 2;
  }

  Widget _buildProgressItem({
    required IconData icon,
    required String title,
    required String value,
    required double progress,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              title,
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),

            Text(
              value,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.white10,
            valueColor:
            const AlwaysStoppedAnimation(
              Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
}