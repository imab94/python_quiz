import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

import 'package:python_quiz/screens/topic_quiz_screen.dart';

import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/widgets/code_block.dart';
import 'package:python_quiz/widgets/topic_quiz_card.dart';
import 'package:python_quiz/widgets/lesson_navigation_card.dart';

import 'package:python_quiz/services/favourites_service.dart';
import 'package:python_quiz/widgets/favourite_button.dart';

import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/widgets/completed_button.dart';
import 'package:python_quiz/services/continue_reading_service.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({
    super.key,
    required this.topic,
    required this.topicList,
    required this.currentIndex,
  });

  final Topic topic;
  final List<Topic> topicList;
  final int currentIndex;

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  bool isFavorite = false;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadFavorite();
    _loadCompleted();
    _saveLastOpenedTopic();
  }

  Future<void> _loadCompleted() async {
    final completed = await CompletedService.isCompleted(widget.topic.title);

    if (!mounted) return;

    setState(() {
      isCompleted = completed;
    });
  }

  Future<void> _loadFavorite() async {
    final value = await FavoritesService.isFavorite(widget.topic.title);

    if (!mounted) return;

    setState(() {
      isFavorite = value;
    });
  }

  Future<void> _saveLastOpenedTopic() async {
    await ContinueReadingService.saveLastTopic(
      widget.topic.title,
    );
  }

  String estimateQuizTime(int questionCount) {
    final minutes = (questionCount * 0.3).ceil();

    return "$minutes Minute${minutes > 1 ? "s" : ""}";
  }

  @override
  Widget build(BuildContext context) {
    final previousTopic = widget.currentIndex > 0
        ? widget.topicList[widget.currentIndex - 1]
        : null;

    final nextTopic = widget.currentIndex < widget.topicList.length - 1
        ? widget.topicList[widget.currentIndex + 1]
        : null;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    const Spacer(),
                    FavoriteButton(
                      isFavorite: isFavorite,
                      onPressed: () async {
                        final value = await FavoritesService.toggleFavorite(
                          widget.topic.title,
                        );

                        if (!mounted) return;

                        setState(() {
                          isFavorite = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.topic.level,
                    style: GoogleFonts.lato(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.topic.title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                ...widget.topic.sections.map(
                  (section) => _buildSection(section),
                ),
                const SizedBox(height: 20),
                LessonNavigationCard(
                  previousTitle: previousTopic?.title,
                  nextTitle: nextTopic?.title,
                  onPrevious: previousTopic == null
                      ? null
                      : () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TopicScreen(
                                topic: previousTopic,
                                topicList: widget.topicList,
                                currentIndex: widget.currentIndex - 1,
                              ),
                            ),
                          );
                        },
                  onNext: nextTopic == null
                      ? null
                      : () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TopicScreen(
                                topic: nextTopic,
                                topicList: widget.topicList,
                                currentIndex: widget.currentIndex + 1,
                              ),
                            ),
                          );
                        },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),

                CompletedButton(
                  isCompleted: isCompleted,
                  onPressed: () async {
                    await CompletedService.markCompleted(widget.topic.title);

                    if (!mounted) return;

                    setState(() {
                      isCompleted = true;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("🎉 Topic marked as completed!"),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),
                TopicQuizCard(
                  questionCount: widget.topic.quizQuestions.length,
                  estimatedTime: estimateQuizTime(
                    widget.topic.quizQuestions.length,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicQuizScreen(topic: widget.topic),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(TopicSection section) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: GoogleFonts.lato(
              color: Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          SelectableText(
            section.content,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 17,
              height: 1.8,
            ),
          ),

          if (section.syntax != null) ...[
            const SizedBox(height: 30),
            CodeBlock(title: "Syntax", code: section.syntax!),
          ],

          if (section.exampleCode != null) ...[
            const SizedBox(height: 10),
            CodeBlock(title: "Example", code: section.exampleCode!),
          ],

          if (section.output != null) ...[
            const SizedBox(height: 10),
            CodeBlock(title: "Output", code: section.output!),
          ],
        ],
      ),
    );
  }
}
