import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/answer_button.dart';
import 'package:python_quiz/models/quiz_question.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questions,
    required this.onSelectAnswer,
    required this.onExitQuiz,
    this.topWidget,
  });

  final void Function(String answer) onSelectAnswer;
  final VoidCallback onExitQuiz;
  final Widget? topWidget;

  final List<QuizQuestion> questions;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  String? selectedAnswer;
  List<String> displayedAnswers = [];

  void answerQuestion(String answer) {
    if (selectedAnswer != null) {
      return;
    }

    setState(() {
      selectedAnswer = answer;
    });

    Future.delayed(const Duration(milliseconds: 250), () {
      if (!mounted) return;

      final isLastQuestion =
          currentQuestionIndex == widget.questions.length - 1;

      widget.onSelectAnswer(answer);

      if (!isLastQuestion && mounted) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswer = null;
          displayedAnswers =
              widget.questions[currentQuestionIndex].shuffledAnswers;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    currentQuestionIndex = 0;
    displayedAnswers =
        widget.questions[currentQuestionIndex].shuffledAnswers;
  }


  @override
  Widget build(context) {
    final currentQuestion = widget.questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Stack(
          children: [
            /// Exit button pinned to top-left
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Dialog(
                      backgroundColor: const Color(0xFF3A176E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.amber,
                              size: 60,
                            ),

                            const SizedBox(height: 18),

                            Text(
                              "Exit Quiz?",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 14),

                            Text(
                              "Your current quiz progress will be lost.\n\nAre you sure you want to exit?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 17,
                                height: 1.5,
                              ),
                            ),

                            const SizedBox(height: 28),

                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Continue Quiz",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.redAccent,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onExitQuiz();
                                },
                                child: Text(
                                  "Exit Quiz",
                                  style: GoogleFonts.lato(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ),
            /// Quiz content
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Question ${currentQuestionIndex + 1}/${widget.questions.length}",
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      if (widget.topWidget != null)
                        widget.topWidget!,
                    ],
                  ),

                  const SizedBox(height: 16),

                  LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) / widget.questions.length,
                    minHeight: 8,
                    backgroundColor: Colors.white12,
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  const SizedBox(height: 28),
                  Text(
                    currentQuestion.text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 201, 153, 251),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),
                  ...displayedAnswers.map(
                    (answer) => AnswerButton(
                      answerText: answer,
                      selected: selectedAnswer == answer,
                      onTap: () {
                        answerQuestion(answer);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
