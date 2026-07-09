import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/screens/topic_quiz_screen.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/screens/quiz_report_screen.dart';
import 'package:python_quiz/widgets/achievement_popup.dart';
import 'package:python_quiz/data/achievements.dart';
import 'package:python_quiz/services/achievement_manager.dart';
import 'package:python_quiz/services/notification_service.dart';
import 'package:python_quiz/services/quiz_notification_service.dart';

class TopicResultScreen extends StatefulWidget {
  const TopicResultScreen({
    super.key,
    required this.topic,
    required this.selectedAnswers,
  });

  final Topic topic;
  final List<String> selectedAnswers;

  @override
  State<TopicResultScreen> createState() => _TopicResultScreenState();
}

class _TopicResultScreenState extends State<TopicResultScreen> {
  final List<String> unlockedAchievements = [];

  @override
  void initState() {
    super.initState();
    _initializeResult();
  }

  Future<void> _initializeResult() async {
    await _saveQuizResult();

    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for (final id in unlockedAchievements) {

        final achievement =
        allAchievements.firstWhere(
              (a) => a.id == id,
        );

        await showAchievementPopup(
          context: context,
          achievement: achievement,
        );
      }
    });
  }

  Future<void> _saveQuizResult() async {
    await QuizProgressService.saveQuizResult(
      topicTitle: widget.topic.title,
      score: correctAnswers,
      totalQuestions: widget.topic.quizQuestions.length,
      selectedAnswers: widget.selectedAnswers,
    );

    // Add notification only if the quiz is passed
    final passed =
        correctAnswers >=
            (widget.topic.quizQuestions.length * 0.6).ceil();

    if (passed) {
      final shouldNotify =
      await QuizNotificationService.shouldNotify(
        widget.topic.title,
      );

      if (shouldNotify) {
        await NotificationService.addQuizPassedNotification(
          topicTitle: widget.topic.title,
          score: correctAnswers,
          totalQuestions: widget.topic.quizQuestions.length,
        );
      }
    }

    await AchievementManager.onTopicQuizCompleted(
      context: context,
      score: correctAnswers,
      totalQuestions: widget.topic.quizQuestions.length,
    );
  }

  int get correctAnswers {
    int score = 0;

    for (int i = 0; i < widget.topic.quizQuestions.length; i++) {
      final userAnswer = i < widget.selectedAnswers.length
          ? widget.selectedAnswers[i]
          : "";

      if (userAnswer == widget.topic.quizQuestions[i].answers.first) {
        score++;
      }
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.topic.quizQuestions.length;
    final score = correctAnswers;
    final percentage = ((score / total) * 100).round();

    IconData trophyIcon;
    String message;
    Color color;

    if (percentage == 100) {
      trophyIcon = Icons.workspace_premium;
      message = "Perfect Score!";
      color = Colors.amber;
    } else if (percentage >= 80) {
      trophyIcon = Icons.emoji_events;
      message = "Excellent!";
      color = Colors.greenAccent;
    } else if (percentage >= 60) {
      trophyIcon = Icons.thumb_up;
      message = "Good Job!";
      color = Colors.lightBlueAccent;
    } else {
      trophyIcon = Icons.menu_book;
      message = "Keep Practicing";
      color = Colors.orangeAccent;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Icon(
                  trophyIcon,
                  size: 90,
                  color: color,
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.topic.title,
                  style: GoogleFonts.lato(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white12,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$score / $total",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "$percentage%",
                        style: GoogleFonts.lato(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _stat(
                            "Correct",
                            score.toString(),
                            Colors.greenAccent,
                          ),
                          _stat(
                            "Wrong",
                            (total - score).toString(),
                            Colors.redAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizReportScreen(
                            topic: widget.topic,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.analytics_outlined),
                    label: const Text("Review Answers"),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TopicQuizScreen(
                            topic: widget.topic,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Retry Quiz"),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.menu_book),
                    label: const Text("Back To Lesson"),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
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
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
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