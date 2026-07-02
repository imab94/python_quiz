import 'package:flutter/material.dart';
import 'package:python_quiz/data/achievements.dart';
import 'package:python_quiz/services/achievement_service.dart';
import 'package:python_quiz/models/achievement.dart';
import 'package:python_quiz/models/achievement_progress.dart';
import 'package:python_quiz/services/achievement_progress_service.dart';

class AchievementDashboardCard extends StatelessWidget {
  const AchievementDashboardCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        AchievementService.getUnlockedAchievements(),
        AchievementProgressService.getNextAchievement(),
        AchievementProgressService.getNextAchievementProgress(),
      ]),
      builder: (context, snapshot) {
        final data = snapshot.data;

        final unlocked =
            data?[0] as List<String>? ?? <String>[];

        final nextAchievement =
        data?[1] as Achievement?;

        final nextProgress =
        data?[2] as AchievementProgress?;

        final total = allAchievements.length;
        final completed = unlocked.length;

        final progress =
        total == 0 ? 0.0 : completed / total;

        final progressPercent =
        (progress * 100).round();

        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 180,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .07),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.emoji_events, color: Colors.amber, size: 22),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Achievements",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.white54),
                  ],
                ),

                const SizedBox(height: 14),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.white12,
                    valueColor: const AlwaysStoppedAnimation(Colors.amber),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$completed / $total Badges",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "$progressPercent%",
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 2),

                const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  nextAchievement?.title ?? "All achievements unlocked!",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                if (nextAchievement != null && nextProgress != null)
                  Text(
                    "${nextProgress.current} / ${nextProgress.target} "
                        "${AchievementProgressService.getProgressLabel(nextAchievement.id)}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
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
