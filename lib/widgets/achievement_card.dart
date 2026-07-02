import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/achievement.dart';
import 'package:python_quiz/models/achievement_progress.dart';
import 'package:python_quiz/services/achievement_progress_service.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
    required this.unlocked,
  });

  final Achievement achievement;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AchievementProgress>(
      future: AchievementProgressService.getProgress(achievement.id),
      builder: (context, snapshot) {
        final progress =
            snapshot.data ?? const AchievementProgress(current: 0, target: 1);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            color: unlocked
                ? Colors.white.withValues(alpha: .08)
                : Colors.white.withValues(alpha: .03),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: unlocked
                  ? achievement.color.withValues(alpha: .45)
                  : Colors.white12,
            ),
            boxShadow: unlocked
                ? [
                    BoxShadow(
                      color: achievement.color.withValues(alpha: .18),
                      blurRadius: 18,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge Icon
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: unlocked
                        ? achievement.color.withValues(alpha: .18)
                        : Colors.grey.withValues(alpha: .15),
                  ),
                  child: Icon(
                    achievement.icon,
                    size: 32,
                    color: unlocked ? achievement.color : Colors.grey,
                  ),
                ),

                const SizedBox(width: 18),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              achievement.title,
                              style: GoogleFonts.lato(
                                color: unlocked ? Colors.white : Colors.white60,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          if (unlocked)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: .18),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Unlocked",
                                style: GoogleFonts.lato(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(
                        achievement.description,
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                          height: 1.45,
                        ),
                      ),

                      const SizedBox(height: 10),

                      if (progress.target > 1) ...[
                        const SizedBox(height: 8),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Progress",
                            style: TextStyle(
                              color: achievement.color,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        const SizedBox(height: 6),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: progress.current / progress.target,
                            minHeight: 8,
                            backgroundColor: Colors.white12,
                            valueColor: AlwaysStoppedAnimation(
                              achievement.color,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Center(
                          child: Text(
                            "${progress.current} / ${progress.target} "
                                "${AchievementProgressService.getProgressLabel(achievement.id)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),
                      ],
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withValues(alpha: .18),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),

                                const SizedBox(width: 4),

                                Text(
                                  "+${achievement.xp} XP",
                                  style: GoogleFonts.lato(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          Icon(
                            unlocked ? Icons.check_circle : Icons.lock_outline,
                            color: unlocked ? Colors.greenAccent : Colors.grey,
                            size: 28,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
