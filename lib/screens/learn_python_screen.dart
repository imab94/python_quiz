import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/data/topics.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/screens/topic_screen.dart';
import 'package:python_quiz/widgets/topic_card.dart';

class LearnPythonScreen extends StatelessWidget {
  const LearnPythonScreen({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),

            IconButton(
              onPressed: onBack,
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 22,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Learn Python",
              style: GoogleFonts.lato(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Master Python from Beginner to Advanced",
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 35),

            _buildTopicSection(
              context: context,
              icon: Icons.rocket_launch,
              color: Colors.lightBlueAccent,
              title: "Getting Started",
              topics: introductionTopics,
            ),

            _buildTopicSection(
              context: context,
              icon: Icons.school,
              color: Colors.amber,
              title: "Beginner",
              topics: beginnerTopics,
            ),

            _buildTopicSection(
              context: context,
              icon: Icons.auto_stories,
              color: Colors.orange,
              title: "Intermediate",
              topics: intermediateTopics,
            ),

            _buildTopicSection(
              context: context,
              icon: Icons.psychology,
              color: Colors.redAccent,
              title: "Advanced",
              topics: advancedTopics,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicSection({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required List<Topic> topics,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.lato(
                color: color,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ...List.generate(
          topics.length,
              (index) {
            final topic = topics[index];
            return TopicCard(
              title: topic.title,
              // Preview only first section
              description: topic.sections.isNotEmpty
                  ? topic.sections.first.content
                  : "",
              onTap: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_) => TopicScreen(
                      topic: topic,
                      topicList: topics,
                      currentIndex: index,
                    ),
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}