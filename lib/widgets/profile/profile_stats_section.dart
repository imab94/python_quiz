import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/profile_summary.dart';

import 'profile_stat_card.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({
    super.key,
    required this.summary,
  });

  final ProfileSummary summary;

  String _formatXP(int xp) {
    if (xp >= 1000000) {
      return "${(xp / 1000000).toStringAsFixed(1)}M";
    }

    if (xp >= 1000) {
      return "${(xp / 1000).toStringAsFixed(1)}K";
    }

    return xp.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        8,
        24,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Learning Overview",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: ProfileStatCard(
                  icon: Icons.star_rounded,
                  value: _formatXP(summary.totalXp),
                  label: "XP",
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: ProfileStatCard(
                  icon: Icons.local_fire_department_rounded,
                  value: summary.dayStreak.toString(),
                  label: "Day Streak",
                  iconColor: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [

              Expanded(
                child: ProfileStatCard(
                  icon: Icons.workspace_premium_rounded,
                  value: summary.certificateName,
                  label: "Certificate",
                  iconColor: Colors.amber,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: ProfileStatCard(
                  icon: Icons.emoji_events_rounded,
                  value: summary.achievementCount.toString(),
                  label: "Achievements",
                  iconColor: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}