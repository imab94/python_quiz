import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/data/all_topics.dart';
import 'package:python_quiz/screens/quiz_report_screen.dart';
import 'package:python_quiz/screens/topic_quiz_screen.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/widgets/quiz_progress_header.dart';
import '../widgets/quiz_progress_card.dart';

class QuizProgressScreen extends StatefulWidget {
  const QuizProgressScreen({super.key});

  @override
  State<QuizProgressScreen> createState() => _QuizProgressScreenState();
}

class _QuizProgressScreenState extends State<QuizProgressScreen> {
  Map<String, dynamic> quizResults = {};

  @override
  void initState() {
    super.initState();
    loadQuizResults();
  }

  Future<void> loadQuizResults() async {
    quizResults =
    await QuizProgressService.getAllQuizResults();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final attemptedTopics = quizResults.length;

    final passedTopics = quizResults.values
        .where((result) => result["passed"] == true)
        .length;
    final totalTopics = allTopics.length;
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
                  "Quiz Progress",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              QuizProgressHeader(
                totalTopics: totalTopics,
                attemptedTopics: attemptedTopics,
                passedTopics: passedTopics,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allTopics.length,
                  itemBuilder: (context, index) {
                    final topic = allTopics[index];

                    final result =
                    quizResults[topic.title];

                    final attempted =
                        result != null;

                    String status;

                    Color color;

                    if (!attempted) {
                      status = "Not Attempted";
                      color = Colors.orangeAccent;
                    } else if (result["passed"]) {
                      status = "Passed";
                      color = Colors.greenAccent;
                    } else {
                      status = "Failed";
                      color = Colors.redAccent;
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child:
                      QuizProgressCard(
                        title: topic.title,
                        level: topic.level,
                        status: attempted
                            ? "$status • ${result["score"]}/${result["totalQuestions"]}"
                            : status,
                        statusColor: color,

                        // LEFT BUTTON
                        primaryActionText: attempted ? "View Report" : "Start Quiz",

                        onPrimaryTap: () {
                          if (attempted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuizReportScreen(
                                  topic: topic,
                                ),
                              ),
                            ).then((_) {
                              loadQuizResults();
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TopicQuizScreen(
                                  topic: topic,
                                ),
                              ),
                            ).then((_) {
                              loadQuizResults();
                            });
                          }
                        },
                        // RIGHT BUTTON
                        secondaryActionText: attempted
                            ? (result["passed"]
                            ? "Improve Score"
                            : "Retry Quiz")
                            : null,

                        onSecondaryTap: attempted
                            ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TopicQuizScreen(
                                topic: topic,
                              ),
                            ),
                          ).then((_) {
                            loadQuizResults();
                          });
                        }
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}