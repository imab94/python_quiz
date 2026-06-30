import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/data/all_topics.dart';
import 'package:python_quiz/screens/topic_screen.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/widgets/app_background.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  List<String> completed = [];

  @override
  void initState() {
    super.initState();
    loadCompleted();
  }

  Future<void> loadCompleted() async {
    completed = await CompletedService.getCompletedTopics();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final completedTopics = allTopics
        .where((topic) => completed.contains(topic.title))
        .toList();

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  "Completed Topics",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),

              Expanded(
                child: completedTopics.isEmpty
                    ? Center(
                  child: Text(
                    "No completed topics yet.",
                    style: GoogleFonts.lato(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount: completedTopics.length,
                  itemBuilder: (context, index) {
                    final topic = completedTopics[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      color: Colors.white10,
                      child: ListTile(
                        leading: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        title: Text(
                          topic.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          topic.level,
                          style: const TextStyle(color: Colors.amber),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white70,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TopicScreen(
                                topic: topic,
                                topicList: allTopics,
                                currentIndex:
                                allTopics.indexOf(topic),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}