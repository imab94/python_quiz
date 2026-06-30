import 'package:flutter/material.dart';

import 'package:python_quiz/models/quiz_question.dart';
import 'package:python_quiz/screens/questions_screen.dart';
import 'package:python_quiz/screens/universal_quiz_result_screen.dart';
import 'package:python_quiz/services/challenge_question_service.dart';
import 'package:python_quiz/widgets/app_background.dart';

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

  final List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    questions =
        ChallengeQuestionService.getQuestions(widget.level);
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
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
  }

  void exitQuiz() {
    Navigator.pop(context);
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
        ),
      ),
    );
  }
}