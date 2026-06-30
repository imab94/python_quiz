import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/answer_button.dart';
import 'package:python_quiz/data/python_challenge.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onExitQuiz,
  });

  final void Function(String answer) onSelectAnswer;
  final VoidCallback onExitQuiz;

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
      widget.onSelectAnswer(answer);
      if (currentQuestionIndex + 1 < questions.length) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswer = null;
          displayedAnswers = questions[currentQuestionIndex].shuffledAnswers;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
    displayedAnswers = questions[currentQuestionIndex].shuffledAnswers;
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

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
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text('Exit Quiz'),
                      content: const Text(
                        'Your progress will be lost. Continue?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            widget.onExitQuiz();
                          },
                          child: const Text('Exit'),
                        ),
                      ],
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
                  Text(
                    'Question ${currentQuestionIndex + 1}/${questions.length}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),
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
