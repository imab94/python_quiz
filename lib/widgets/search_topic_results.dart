import 'package:flutter/material.dart';
import 'package:python_quiz/widgets/search_topic_result.dart';
import '../models/topic.dart';
import '../screens/topic_screen.dart';

class SearchTopicResults extends StatelessWidget {
  const SearchTopicResults({
    super.key,
    required this.query,
    required this.topics,
  });

  final String query;
  final List<Topic> topics;

  @override
  Widget build(BuildContext context) {
    final filtered =
    topics.where((topic) {
      return topic.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filtered.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: filtered.map((topic) {
        return SearchTopicResult(
          title: topic.title,
          level: topic.level,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TopicScreen(
                  topic: topic,
                  topicList: topics,
                  currentIndex: topics.indexOf(topic),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}