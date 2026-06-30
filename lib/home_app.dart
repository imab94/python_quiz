import 'package:flutter/material.dart';

import 'package:python_quiz/start_screen.dart';
import 'package:python_quiz/widgets/app_background.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackground(
          child: const StartScreen(),
        ),
      ),
    );
  }
}