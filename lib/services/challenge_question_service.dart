import 'dart:math';

import 'package:python_quiz/data/all_topics.dart';
import 'package:python_quiz/models/quiz_question.dart';

enum ChallengeLevel {
  beginner,
  intermediate,
  advanced,
  mixed,
}

class ChallengeQuestionService {
  static List<QuizQuestion> getQuestions(ChallengeLevel level) {
    List<QuizQuestion> questions = [];

    switch (level) {
      case ChallengeLevel.beginner:
        questions = _beginnerQuestions();
        break;

      case ChallengeLevel.intermediate:
        questions = _intermediateQuestions();
        break;

      case ChallengeLevel.advanced:
        questions = _advancedQuestions();
        break;

      case ChallengeLevel.mixed:
        questions = _mixedQuestions();
        break;
    }

    // Shuffle the questions
    questions.shuffle(Random());

    // Decide how many questions this challenge should have
    int limit;

    switch (level) {
      case ChallengeLevel.beginner:
        limit = 10;
        break;

      case ChallengeLevel.intermediate:
        limit = 15;
        break;

      case ChallengeLevel.advanced:
        limit = 20;
        break;

      case ChallengeLevel.mixed:
        limit = 30;
        break;
    }

    // Return only the required number of questions
    if (questions.length > limit) {
      return questions.take(limit).toList();
    }

    return questions;
  }

  static List<QuizQuestion> _beginnerQuestions() {
    return allTopics
        .where((topic) => topic.level == "Beginner")
        .expand((topic) => topic.quizQuestions)
        .toList();
  }

  static List<QuizQuestion> _intermediateQuestions() {
    return allTopics
        .where((topic) => topic.level == "Intermediate")
        .expand((topic) => topic.quizQuestions)
        .toList();
  }

  static List<QuizQuestion> _advancedQuestions() {
    return allTopics
        .where((topic) => topic.level == "Advanced")
        .expand((topic) => topic.quizQuestions)
        .toList();
  }

  static List<QuizQuestion> _mixedQuestions() {
    return allTopics
        .expand((topic) => topic.quizQuestions)
        .toList();
  }
}