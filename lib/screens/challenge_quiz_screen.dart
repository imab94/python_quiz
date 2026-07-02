import 'package:flutter/material.dart';
import 'dart:async';
import 'package:python_quiz/models/quiz_question.dart';
import 'package:python_quiz/screens/questions_screen.dart';
import 'package:python_quiz/screens/universal_quiz_result_screen.dart';
import 'package:python_quiz/services/challenge_question_service.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/widgets/quiz_timer.dart';

class ChallengeQuizScreen extends StatefulWidget {
  const ChallengeQuizScreen({
    super.key,
    required this.level,
  });

  final ChallengeLevel level;

  @override
  State<ChallengeQuizScreen> createState() =>
      _ChallengeQuizScreenState();
}

class _ChallengeQuizScreenState
    extends State<ChallengeQuizScreen> {
  late final List<QuizQuestion> questions;
  Timer? timer;
  int remainingSeconds = 0;

  bool isSubmitting = false;

  final List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    questions =
        ChallengeQuestionService.getQuestions(widget.level);
    remainingSeconds = (questions.length * 0.3 * 60).ceil();

    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (_) {
        if (!mounted || isSubmitting) return;

        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer?.cancel();
          finishQuiz();
        }
      },
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:${remaining.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      finishQuiz();
    }
  }

  void exitQuiz() {
    Navigator.pop(context);
  }

  Future<void> finishQuiz() async {
    if (isSubmitting) return;

    isSubmitting = true;

    timer?.cancel();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => UniversalQuizResultScreen(
          title: widget.level.name.toUpperCase(),
          questions: questions,
          selectedAnswers: selectedAnswers,
          challengeLevel: widget.level,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: QuestionsScreen(
          questions: questions,
          onSelectAnswer: chooseAnswer,
          onExitQuiz: exitQuiz,
          topWidget: QuizTimer(
            time: formatTime(remainingSeconds),
            isWarning: remainingSeconds <= 30,
          ),
        ),
      ),
    );
  }
}