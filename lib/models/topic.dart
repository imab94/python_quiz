import 'topic_section.dart';
import 'package:python_quiz/models/quiz_question.dart';

class Topic {
  final String title;
  final String level;
  final int priority;
  final bool isRecommended;
  final String recommendationReason;
  final List<TopicSection> sections;
  final List<QuizQuestion> quizQuestions;

  const Topic({
    required this.title,
    required this.level,
    required this.priority,
    required this.isRecommended,  //
    required this.recommendationReason,
    required this.sections,
    required this.quizQuestions,
  });
}