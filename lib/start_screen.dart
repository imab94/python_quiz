import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/screens/learn_python_screen.dart';
import 'package:python_quiz/screens/topic_screen.dart';
import 'package:python_quiz/services/challenge_selection_screen.dart';
import 'package:python_quiz/services/continue_reading_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/widgets/home_card.dart';
import 'package:python_quiz/widgets/search_topic_bar.dart';
import 'package:python_quiz/widgets/search_topic_results.dart';
import 'package:python_quiz/widgets/why_python_card.dart';
import 'package:python_quiz/widgets/popular_topic_chip.dart';
import 'package:python_quiz/widgets/course_stats_card.dart';
import 'package:python_quiz/data/beginner/01_variables.dart';
import 'package:python_quiz/data/beginner/03_loops.dart';
import 'package:python_quiz/data/beginner/04_functions.dart';
import 'package:python_quiz/data/intermediate/oop/01_oop_introduction.dart';
import 'package:python_quiz/data/intermediate/02_decorators.dart';
import 'package:python_quiz/data/intermediate/03_generators.dart';
import 'package:python_quiz/data/advanced/05_asyncio.dart';
import 'package:python_quiz/data/intermediate/01_exception_handling.dart';
import 'package:python_quiz/screens/favorites_screen.dart';
import 'package:python_quiz/screens/completed_screen.dart';
import 'package:python_quiz/widgets/dashboard_card.dart';
import 'data/all_topics.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/widgets/continue_learning_card.dart';
import 'package:python_quiz/widgets/stat_chip.dart';
import 'package:python_quiz/screens/quiz_progress_screen.dart';
import 'package:python_quiz/services/challenge_progress_service.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  static const popularTopics = [
    variablesTopic,
    functionsTopic,
    loopsTopic,
    oopIntroductionTopic,
    decoratorsTopic,
    generatorsTopic,
    asyncioTopic,
    exceptionHandlingTopic,
  ];

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String searchQuery = "";
  int completedCount = 0;
  double completionPercentage = 0;
  String? lastTopicTitle;
  String? lastTopicLevel;
  int completedQuizCount = 0;

  int passedChallenges = 0;
  int failedChallenges = 0;

  @override
  void initState() {
    super.initState();
    loadProgress();
    loadLastTopic();
    loadQuizProgress();
    loadChallengeProgress();
  }

  Future<void> loadProgress() async {
    completedCount = await CompletedService.getCompletedCount();
    completionPercentage =
    await CompletedService.getCompletionPercentage(allTopics.length);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> loadLastTopic() async {
    final title = await ContinueReadingService.getLastTopic();
    if (title == null) return;
    try {
      final topic = allTopics.firstWhere(
            (topic) => topic.title == title,
      );
      if (!mounted) return;
      setState(() {
        lastTopicTitle = topic.title;
        lastTopicLevel = topic.level;
      });
    } catch (_) {
      // Topic not found.
    }
  }

  Future<void> loadQuizProgress() async {
    final results = await QuizProgressService.getAllQuizResults();
    if (!mounted) return;
    setState(() {
      completedQuizCount = results.length;
    });
  }

  Future<void> loadChallengeProgress() async {
    passedChallenges =
    await ChallengeProgressService.getPassedCount();
    failedChallenges =
    await ChallengeProgressService.getFailedCount();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> refreshDashboard() async {
    await loadProgress();
    await loadLastTopic();
    await loadQuizProgress();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalTopics = allTopics.length;
    final int totalQuizQuestions = allTopics.fold(0,
          (sum, topic) => sum + topic.quizQuestions.length,
    );
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          child: Column(
            children: [
              /// Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .15),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.auto_stories,
                      size: 18,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Python Learning Platform",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 45),
              /// Logo with Glow
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: .03),
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: .12),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurpleAccent.withValues(alpha: .30),
                          blurRadius: 40,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/img_1.png',
                    width: 135,
                    color: const Color(0xFFB89BFF),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              if (lastTopicTitle != null) ...[
                ContinueLearningCard(
                  title: lastTopicTitle!,
                  level: lastTopicLevel!,
                  onTap: () {
                    final topic = allTopics.firstWhere(
                          (t) => t.title == lastTopicTitle,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicScreen(
                          topic: topic,
                          topicList: allTopics,
                          currentIndex: allTopics.indexOf(topic),
                        ),
                      ),
                    ).then((_) {
                      loadProgress();
                      loadLastTopic();
                    });
                  },
                ),
                const SizedBox(height: 22),
              ],
              Text(
                "Learn Python",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Master Python from Beginner to Advanced",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              SearchTopicBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 18),
              if (searchQuery.isNotEmpty)
                SearchTopicResults(
                  query: searchQuery,
                  topics: allTopics,
                ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatChip(
                    icon: Icons.menu_book_rounded,
                    value: "$totalTopics",
                    label: "Topics",
                    color: Colors.amber,
                  ),

                  const SizedBox(width: 12),

                  StatChip(
                    icon: Icons.quiz_rounded,
                    value: "$totalQuizQuestions",
                    label: "Questions",
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              const SizedBox(height: 34),
              HomeCard(
                title: "Learn Python",
                subtitle: "$totalTopics+ Topics\nBeginner → Advanced",
                icon: Icons.menu_book_rounded,
                iconColor: Colors.amber,
                progress: completionPercentage,
                progressText:
                "$completedCount / ${allTopics.length} "
                    "Topics Completed (${(completionPercentage * 100).round()}%)",
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LearnPythonScreen(),
                    ),
                  );
                  await refreshDashboard();
                },
              ),
              const SizedBox(height: 18),
              HomeCard(
                title: "Random Challenge",
                subtitle:
                "$totalQuizQuestions+ Random Questions"
                    "\n🏆 $passedChallenges Passed • $failedChallenges Failed",
                icon: Icons.quiz_rounded,
                iconColor: Colors.lightBlueAccent,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChallengeSelectionScreen(),
                    ),
                  );
                  await refreshDashboard();
                  await loadQuizProgress();
                  await loadChallengeProgress();
                },
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: "Favourites",
                      subtitle: "Saved Topics",
                      icon: Icons.favorite,
                      iconColor: Colors.redAccent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FavoritesScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DashboardCard(
                      title: "Completed",
                      subtitle: "Finished Topics",
                      icon: Icons.check_circle,
                      iconColor: Colors.greenAccent,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CompletedScreen(),
                          ),
                        );
                        await refreshDashboard();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              HomeCard(
                title: "Quiz Progress",
                subtitle: "Track your performance",
                progress: completedQuizCount / allTopics.length,
                progressText:
                "$completedQuizCount / ${allTopics.length} Quizzes Completed",
                icon: Icons.analytics_rounded,
                iconColor: Colors.lightGreenAccent,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuizProgressScreen(),
                    ),
                  );
                  await refreshDashboard();
                },
              ),
              const SizedBox(height: 18),
              const WhyPythonCard(),
              const SizedBox(height: 25),
              Text(
                "Popular Topics",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: StartScreen.popularTopics.length,
                  itemBuilder: (context, index) {
                    final topic = StartScreen.popularTopics[index];
                    return PopularTopicChip(
                      topic: topic,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TopicScreen(
                              topic: topic,
                              topicList: StartScreen.popularTopics,
                              currentIndex: index,
                            ),
                          ),
                        );

                        await refreshDashboard();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              const CourseStatsCard(),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}