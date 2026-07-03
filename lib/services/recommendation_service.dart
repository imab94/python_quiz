import 'package:python_quiz/data/topics.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/services/completed_service.dart';

class RecommendationService {
  static Future<Topic?> getRecommendedTopic() async {
    final completedTopics =
    await CompletedService.getCompletedTopics();

    final sortedTopics = [
      ...introductionTopics,
      ...beginnerTopics,
      ...intermediateTopics,
      ...advancedTopics,
    ];

    sortedTopics.sort(
          (Topic a, Topic b) =>
          a.priority.compareTo(b.priority),
    );

    for (final topic in sortedTopics) {
      if (!topic.isRecommended) {
        continue;
      }

      if (!completedTopics.contains(topic.title)) {
        return topic;
      }
    }

    // All topics completed
    return null;
  }
}