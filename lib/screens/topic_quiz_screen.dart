import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/quiz_question.dart';
import 'package:python_quiz/screens/topic_result_screen.dart';
import 'package:python_quiz/widgets/app_background.dart';

class TopicQuizScreen extends StatefulWidget {
  const TopicQuizScreen({super.key, required this.topic});

  final Topic topic;

  @override
  State<TopicQuizScreen> createState() => _TopicQuizScreenState();
}

class _TopicQuizScreenState extends State<TopicQuizScreen> {
  int currentQuestionIndex = 0;

  String? selectedAnswer;
  late List<String> shuffledAnswers;

  final List<String> selectedAnswers = [];

  QuizQuestion get currentQuestion =>
      widget.topic.quizQuestions[currentQuestionIndex];

  @override
  void initState() {
    super.initState();
    shuffledAnswers = currentQuestion.shuffledAnswers;
  }

  void nextQuestion() {
    if (selectedAnswer == null) return;

    selectedAnswers.add(selectedAnswer!);

    if (currentQuestionIndex ==
        widget.topic.quizQuestions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TopicResultScreen(
            topic: widget.topic,
            selectedAnswers: selectedAnswers,
          ),
        ),
      );
      return;
    }

    setState(() {
      currentQuestionIndex++;
      selectedAnswer = null;
      shuffledAnswers = currentQuestion.shuffledAnswers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),

                    Expanded(
                      child: Text(
                        widget.topic.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 48),
                  ],
                ),

                const SizedBox(height: 25),

                Text(
                  "Question ${currentQuestionIndex + 1} / ${widget.topic.quizQuestions.length}",
                  style: GoogleFonts.lato(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value:
                      (currentQuestionIndex + 1) /
                      widget.topic.quizQuestions.length,
                  backgroundColor: Colors.white12,
                  color: Colors.amber,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(20),
                ),

                const SizedBox(height: 40),
                Text(
                  currentQuestion.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),
                Expanded(
                  child: ListView.builder(
                    itemCount: shuffledAnswers.length,
                    itemBuilder: (context, index) {
                      final answer = shuffledAnswers[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),

                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .08),
                          borderRadius: BorderRadius.circular(16),

                          border: Border.all(
                            color: selectedAnswer == answer
                                ? Colors.amber
                                : Colors.white12,
                            width: 2,
                          ),
                        ),

                        child: RadioListTile<String>(
                          value: answer,
                          groupValue: selectedAnswer,
                          activeColor: Colors.amber,
                          title: Text(
                            answer,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),

                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: selectedAnswer == null ? null : nextQuestion,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    child: Text(
                      currentQuestionIndex ==
                              widget.topic.quizQuestions.length - 1
                          ? "Finish Quiz"
                          : "Next Question",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
