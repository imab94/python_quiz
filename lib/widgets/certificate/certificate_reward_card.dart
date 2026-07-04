import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/certificate.dart';

class CertificateRewardCard extends StatelessWidget {
  const CertificateRewardCard({
    super.key,
    required this.currentLevel,
  });

  final CertificateLevel currentLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Certificate Levels",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 20),

          _levelTile(
            level: CertificateLevel.bronze,
            emoji: "🥉",
            title: "Bronze",
            subtitle: "70% - 84%",
          ),

          const SizedBox(height: 14),

          _levelTile(
            level: CertificateLevel.silver,
            emoji: "🥈",
            title: "Silver",
            subtitle: "85% - 94%",
          ),

          const SizedBox(height: 14),

          _levelTile(
            level: CertificateLevel.gold,
            emoji: "🥇",
            title: "Gold",
            subtitle: "95% - 100%",
          ),

          const SizedBox(height: 28),

          _nextMilestone(),
        ],
      ),
    );
  }

  Widget _nextMilestone() {

    if (currentLevel == CertificateLevel.gold) {

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: .12),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.greenAccent,
          ),
        ),
        child: Column(
          children: [

            const Icon(
              Icons.emoji_events,
              color: Colors.amber,
              size: 40,
            ),

            const SizedBox(height: 12),

            Text(
              "Congratulations!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "You've achieved the highest certification level.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      );
    }

    final nextLevel =
    currentLevel == CertificateLevel.bronze
        ? "Silver"
        : "Gold";

    final required =
    currentLevel == CertificateLevel.bronze
        ? 85
        : 95;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "🎯 Next Goal",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            "$nextLevel Certificate",
            style: GoogleFonts.lato(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Reach an average score of $required% to unlock it.",
            style: GoogleFonts.lato(
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _levelTile({
    required CertificateLevel level,
    required String emoji,
    required String title,
    required String subtitle,
  }) {

    final selected = currentLevel == level;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected
            ? Colors.amber.withValues(alpha: .18)
            : Colors.white.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: selected
              ? Colors.amber
              : Colors.white24,
          width: selected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [

          Text(
            emoji,
            style: const TextStyle(fontSize: 28),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: GoogleFonts.lato(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          if (selected)
            const Icon(
              Icons.check_circle,
              color: Colors.amber,
            ),
        ],
      ),
    );
  }
}