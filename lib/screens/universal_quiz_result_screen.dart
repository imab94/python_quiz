import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/quiz_question.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/services/challenge_question_service.dart';
import 'package:python_quiz/screens/challenge_quiz_screen.dart';

class UniversalQuizResultScreen extends StatelessWidget {
  const UniversalQuizResultScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.selectedAnswers,
    required this.challengeLevel,
  });

  final String title;
  final List<QuizQuestion> questions;
  final List<String> selectedAnswers;
  final ChallengeLevel challengeLevel;

  int get correctAnswers {
    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].answers.first) {
        score++;
      }
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    final total = questions.length;
    final score = correctAnswers;
    final wrong = total - score;
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
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
                title: Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(22),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Column(
                        children: [
                          Icon(trophyIcon, size: 80, color: color),

                          const SizedBox(height: 18),

                          Text(
                            message,
                            style: GoogleFonts.lato(
                              color: color,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 22),

                          Text(
                            "$score / $total",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "$percentage% Accuracy",
                            style: GoogleFonts.lato(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 22),

                          Divider(color: Colors.white.withValues(alpha: .15)),

                          const SizedBox(height: 20),

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
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      "Answer Review",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),
                    ...List.generate(questions.length, (index) {
                      final question = questions[index];

                      final yourAnswer = selectedAnswers[index];

                      final correct = yourAnswer == question.answers.first;

                      return Card(
                        color: Colors.white10,
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Question ${index + 1}",
                                style: GoogleFonts.lato(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                question.text,
                                style: GoogleFonts.lato(color: Colors.white),
                              ),

                              const SizedBox(height: 14),

                              Row(
                                children: [
                                  Icon(
                                    correct ? Icons.check_circle : Icons.cancel,
                                    color: correct
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: Text(
                                      yourAnswer,
                                      style: GoogleFonts.lato(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 30),

                    SizedBox(
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ChallengeQuizScreen(level: challengeLevel),
                            ),
                          );
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Retry Quiz"),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: const Icon(Icons.home),
                        label: const Text("Back Home"),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.lato(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 6),
          Text(title, style: GoogleFonts.lato(color: Colors.white70)),
        ],
      ),
    );
  }
}
