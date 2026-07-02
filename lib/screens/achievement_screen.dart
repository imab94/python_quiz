import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/data/achievements.dart';
import 'package:python_quiz/services/achievement_service.dart';
import 'package:python_quiz/widgets/achievement_card.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/services/xp_service.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  List<String> unlockedAchievements = [];
  int totalXP = 0;

  @override
  void initState() {
    super.initState();
    loadAchievements();
  }

  Future<void> loadAchievements() async {
    unlockedAchievements =
    await AchievementService.getUnlockedAchievements();

    totalXP = await XPService.getTotalXP();

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final unlocked = unlockedAchievements.length;
    final total = allAchievements.length;

    final progress = total == 0 ? 0.0 : unlocked / total;

    final nextAchievement = allAchievements.firstWhere(
      (achievement) => !unlockedAchievements.contains(achievement.id),
      orElse: () => allAchievements.last,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  "Achievements",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                  children: [
                    // ============================
                    // HERO CARD
                    // ============================
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.emoji_events,
                            size: 80,
                            color: Colors.amber,
                          ),

                          const SizedBox(height: 16),

                          Text(
                            "$unlocked / $total",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 44,
                            ),
                          ),

                          Text(
                            "Badges Unlocked",
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 22),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 10,
                              backgroundColor: Colors.white10,
                              valueColor: const AlwaysStoppedAnimation(
                                Colors.amber,
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "${(progress * 100).round()}% Complete",
                            style: GoogleFonts.lato(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 26),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: .05),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),

                                      const SizedBox(height: 8),

                                      // Fixed height title
                                      SizedBox(
                                        height: 42,
                                        child: Center(
                                          child: Text(
                                            "$totalXP XP",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                        "Total XP",
                                        style: GoogleFonts.lato(
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: .05),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.flag,
                                        color: Colors.greenAccent,
                                      ),

                                      const SizedBox(height: 8),

                                      // Fixed height title
                                      SizedBox(
                                        height: 42,
                                        child: Center(
                                          child: Text(
                                            nextAchievement.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                        "Next Badge",
                                        style: GoogleFonts.lato(
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      "Achievement Collection",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 18),

                    ...allAchievements.map(
                      (achievement) => AchievementCard(
                        achievement: achievement,
                        unlocked: unlockedAchievements.contains(achievement.id),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
