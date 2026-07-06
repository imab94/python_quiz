import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/screens/certificate_center_screen.dart';
import 'package:python_quiz/screens/learn_python_screen.dart';
import 'package:python_quiz/screens/topic_screen.dart';

import 'package:python_quiz/services/achievement_service.dart';
import 'package:python_quiz/services/challenge_selection_screen.dart';
import 'package:python_quiz/services/continue_reading_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/widgets/achievement_dashboard_card.dart';
import 'package:python_quiz/widgets/certificate_home_card.dart';
import 'package:python_quiz/widgets/home_card.dart';
import 'package:python_quiz/widgets/search_topic_bar.dart';
import 'package:python_quiz/widgets/search_topic_results.dart';
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
import 'package:python_quiz/screens/quiz_progress_screen.dart';
import 'package:python_quiz/services/challenge_progress_service.dart';
import 'package:python_quiz/services/streak_service.dart';
import 'package:python_quiz/screens/achievement_screen.dart';

import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/services/recommendation_service.dart';
import 'package:python_quiz/widgets/recommended_topic_card.dart';
import 'package:python_quiz/services/certificate_service.dart';

import 'package:python_quiz/screens/notification_screen.dart';
import 'package:python_quiz/services/notification_service.dart';
import 'package:python_quiz/widgets/notifications/notification_bell_button.dart';


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

  int currentStreak = 0;
  int bestStreak = 0;

  int unlockedAchievements = 0;

  Topic? recommendedTopic;
  bool _isCertificateVerified = false;

  int _unreadNotificationCount = 0;

  bool get _shouldShowRecommendation {
    final recommendation = recommendedTopic;
    final continueTopicTitle = lastTopicTitle;

    // No recommendation loaded.
    if (recommendation == null) {
      return false;
    }

    // User has not started any topic yet.
    // Show Today's Recommendation.
    if (continueTopicTitle == null ||
        continueTopicTitle.trim().isEmpty) {
      return true;
    }

    // Hide recommendation when Continue Learning
    // and Today's Recommendation are the same topic.
    return continueTopicTitle.trim().toLowerCase() !=
        recommendation.title.trim().toLowerCase();
  }

  Future<void> _loadUnreadNotificationCount() async {
    final count = await NotificationService.getUnreadCount();

    if (!mounted) return;

    setState(() {
      _unreadNotificationCount = count;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshDashboard();
  }

  Future<void> loadProgress() async {
    completedCount = await CompletedService.getCompletedCount();
    completionPercentage =
    await CompletedService.getCompletionPercentage(allTopics.length);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> loadAchievements() async {
    unlockedAchievements =
    await AchievementService.getUnlockedCount();

    if (!mounted) return;

    setState(() {});
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

  Future<void> loadStreak() async {
    currentStreak = await StreakService.getCurrentStreak();
    bestStreak = await StreakService.getBestStreak();

    if (!mounted) return;

    setState(() {});
  }

  Future<void> refreshDashboard() async {
    await Future.wait([
      loadProgress(),
      loadLastTopic(),
      loadQuizProgress(),
      loadChallengeProgress(),
      loadStreak(),
      loadAchievements(),
      _loadUnreadNotificationCount(),
    ]);

    final recommendation =
    await RecommendationService.getRecommendedTopic();

    final certificateVerified =
    await CertificateService.isEligible();

    if (!mounted) return;

    setState(() {
      recommendedTopic = recommendation;
      _isCertificateVerified = certificateVerified;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuizQuestions = allTopics.fold(0,
          (sum, topic) => sum + topic.quizQuestions.length,
    );
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 24,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 52,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// CENTER BADGE
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
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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

                    /// TOP-RIGHT NOTIFICATION BELL
                    Positioned(
                      right: 0,
                      child: NotificationBellButton(
                        unreadCount: _unreadNotificationCount,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationScreen(),
                            ),
                          );

                          await _loadUnreadNotificationCount();
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),
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
                  onTap: () async {
                    final topic = allTopics.firstWhere(
                          (t) => t.title == lastTopicTitle,
                    );

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicScreen(
                          topic: topic,
                          topicList: allTopics,
                          currentIndex: allTopics.indexOf(topic),
                        ),
                      ),
                    );

                    await refreshDashboard();
                    await _loadUnreadNotificationCount();
                  },
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.orangeAccent.withValues(alpha: .4),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.orangeAccent,
                        size: 42,
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "$currentStreak Day Streak",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "Best Streak: $bestStreak Days",
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              if (_shouldShowRecommendation) ...[
                const SizedBox(height: 18),
                RecommendedTopicCard(
                  topic: recommendedTopic!,
                  onReturn: refreshDashboard,
                ),
              ],

              const SizedBox(height: 18),

              Text(
                "Python Learning Path",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Master Python from Beginner to Advanced",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 18),

              /// ================================
              /// SEARCH TOPICS
              /// ================================
              SearchTopicBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              /// Only add spacing/results when searching.
              if (searchQuery.isNotEmpty) ...[
                const SizedBox(height: 12),

                SearchTopicResults(
                  query: searchQuery,
                  topics: allTopics,
                ),
              ],

              const SizedBox(height: 18),

              /// ================================
              /// COURSE STATS
              /// Topics • Questions • Levels • Hours
              /// ================================
              const CourseStatsCard(),

              const SizedBox(height: 18),

              /// ================================
              /// LEARN PYTHON CARD
              /// ================================
              HomeCard(
                title: "Learn Python",
                // Keep this simple because CourseStatsCard
                // already shows Topics, Questions, Levels and Hours.
                subtitle: "Beginner → Advanced",
                icon: Icons.menu_book_rounded,
                iconColor: Colors.amber,
                progress: completionPercentage,
                progressText:
                "$completedCount / ${allTopics.length} "
                    "Topics Completed "
                    "(${(completionPercentage * 100).round()}%)",
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

              Text(
                "Popular Topics",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
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
                        await _loadUnreadNotificationCount();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              /// ================================
              /// RANDOM CHALLENGE
              /// ================================
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
              CertificateHomeCard(
                completedTopics: completedCount,
                totalTopics: allTopics.length,
                isVerified: _isCertificateVerified,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CertificateCenterScreen(),
                    ),
                  );

                  await refreshDashboard();
                },
              ),

              const SizedBox(height: 18),

              AchievementDashboardCard(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AchievementScreen(),
                    ),
                  );

                  await refreshDashboard();
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
                  const SizedBox(width: 18),
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

              //const WhyPythonCard(),
            ],
          ),
        ),
      ),
    );
  }
}