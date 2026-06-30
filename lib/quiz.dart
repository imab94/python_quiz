import 'package:flutter/material.dart';

import 'package:python_quiz/data/python_challenge.dart';
import 'package:python_quiz/screens/learn_python_screen.dart';
import 'package:python_quiz/questions_screen.dart';
import 'package:python_quiz/results_screen.dart';
import 'package:python_quiz/start_screen.dart';
import 'package:python_quiz/widgets/app_background.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void openLearnPython() {
    setState(() {
      activeScreen = 'learn-python-screen';
    });
  }

  void backToHome(){
    setState((){
      selectedAnswers.clear();
      activeScreen='start-screen';

    });

  }

  void exitQuiz() {
    setState(() {

      selectedAnswers.clear();

      activeScreen='start-screen';

    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();

      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen, openLearnPython);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,
        onExitQuiz: backToHome,);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        onBackHome: backToHome,
      );
    } else if (activeScreen == 'learn-python-screen') {
      screenWidget = LearnPythonScreen(onBack: backToHome);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: AppBackground(child: screenWidget)),
    );
  }
}
