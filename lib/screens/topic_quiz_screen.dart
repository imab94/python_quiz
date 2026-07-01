import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/quiz_question.dart';
import 'package:python_quiz/screens/topic_result_screen.dart';
import 'package:python_quiz/widgets/app_background.dart';
import '../widgets/quiz_timer.dart';


class TopicQuizScreen extends StatefulWidget {
  const TopicQuizScreen({
    super.key,
    required this.topic,
  });
  final Topic topic;

  @override
  State<TopicQuizScreen> createState() => _TopicQuizScreenState();

}

class _TopicQuizScreenState extends State<TopicQuizScreen> {
  late Timer timer;

  late int remainingSeconds;

  int currentQuestionIndex = 0;

  String? selectedAnswer;
  late List<String> shuffledAnswers;

  final List<String> selectedAnswers = [];

  QuizQuestion get currentQuestion =>
      widget.topic.quizQuestions[currentQuestionIndex];

  Future<void> showTimeUpDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xff24113d),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Icon(
                Icons.timer_off,
                color: Colors.redAccent,
                size: 70,
              ),

              const SizedBox(height: 20),

              Text(
                "Time's Up!",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Your quiz is being submitted...",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 25),

              const CircularProgressIndicator(
                color: Colors.amber,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    shuffledAnswers = currentQuestion.shuffledAnswers;
    remainingSeconds =
        (widget.topic.quizQuestions.length * 0.3 * 60).ceil();

    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) return;

        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();

          // Show dialog
          showTimeUpDialog();

          // Submit after 2 seconds
          Future.delayed(const Duration(seconds: 2), () {
            if (!mounted) return;

            Navigator.of(context).pop(); // close dialog

            finishQuiz();
          });
        }
      },
    );
  }

  void finishQuiz() {
    timer.cancel();

    // Save current selected answer (if any)
    if (selectedAnswer != null &&
        selectedAnswers.length == currentQuestionIndex) {
      selectedAnswers.add(selectedAnswer!);
    }

    // Fill unanswered questions with empty answers
    while (selectedAnswers.length < widget.topic.quizQuestions.length) {
      selectedAnswers.add("");
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TopicResultScreen(
          topic: widget.topic,
          selectedAnswers: selectedAnswers,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void nextQuestion() {
    if (selectedAnswer == null) return;

    selectedAnswers.add(selectedAnswer!);

    if (currentQuestionIndex ==
        widget.topic.quizQuestions.length - 1) {
       finishQuiz();
      return;
    }

    setState(() {
      currentQuestionIndex++;
      selectedAnswer = null;
      shuffledAnswers = currentQuestion.shuffledAnswers;
    });
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:${remaining.toString().padLeft(2, '0')}";
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
                                        Navigator.pop(context); // Close dialog
                                        timer.cancel();         // Stop timer
                                        Navigator.pop(context); // Exit quiz
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
                      icon: const Icon(
                          Icons.close,
                          color: Colors.white
                      ),
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
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Question ${currentQuestionIndex + 1} / ${widget.topic.quizQuestions.length}",
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            widget.topic.title,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    QuizTimer(
                      time: formatTime(remainingSeconds),
                      isWarning: remainingSeconds <= 30,
                    ),
                  ],
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
