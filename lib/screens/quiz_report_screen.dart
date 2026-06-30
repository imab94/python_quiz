import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/screens/topic_quiz_screen.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:intl/intl.dart';
import 'package:python_quiz/widgets/quiz_summary_card.dart';
import 'package:python_quiz/widgets/answer_review_card.dart';

class QuizReportScreen extends StatefulWidget {
  const QuizReportScreen({super.key, required this.topic});

  final Topic topic;

  @override
  State<QuizReportScreen> createState() => _QuizReportScreenState();
}

class _QuizReportScreenState extends State<QuizReportScreen> {
  Map<String, dynamic>? quizResult;

  @override
  void initState() {
    super.initState();
    loadResult();
  }

  Future<void> loadResult() async {
    quizResult = await QuizProgressService.getQuizResult(widget.topic.title);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (quizResult == null) {
      return Scaffold(
        body: AppBackground(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final score = quizResult!["score"] as int;
    final total = quizResult!["totalQuestions"] as int;
    final percentage = quizResult!["percentage"] as int;
    final passed = quizResult!["passed"] as bool;

    final answers = List<String>.from(
      quizResult!["selectedAnswers"],
    );

    final completedAt = DateTime.parse(
      quizResult!["completedAt"],
    );

    final formattedDate = DateFormat(
      "dd MMM yyyy • hh:mm a",
    ).format(completedAt);

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  widget.topic.title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(22),
                  children: [
                    QuizSummaryCard(
                      score: score,
                      total: total,
                      percentage: percentage,
                      passed: passed,
                      formattedDate: formattedDate,
                    ),

                    const SizedBox(height: 25),

                    Text(
                      "Your Answers",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 18),

                    ...List.generate(
                      widget.topic.quizQuestions.length,
                          (index) => AnswerReviewCard(
                        questionNumber: index + 1,
                        question: widget.topic.quizQuestions[index],
                        selectedAnswer: answers[index],
                      ),
                    ),

                    const SizedBox(height: 30),

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
                        label: const Text("Retake Quiz"),
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
}
