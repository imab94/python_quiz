import 'topic_section.dart';
import 'package:python_quiz/models/quiz_question.dart';

class Topic {
  final String title;
  final String level;
  final List<TopicSection> sections;

  final List<QuizQuestion> quizQuestions;

  const Topic({
    required this.title,
    required this.level,
    required this.sections,
    required this.quizQuestions,
  });
}