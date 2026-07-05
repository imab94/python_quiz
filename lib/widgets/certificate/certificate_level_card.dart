import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateLevelCard extends StatelessWidget {
  const CertificateLevelCard({
    super.key,
    required this.level,
    required this.selected,
    required this.unlocked,
    required this.onTap,
  });

  final CertificateLevel level;
  final bool selected;
  final bool unlocked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = CertificateThemes.fromLevel(level);

    return InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected
                ? theme.primaryColor.withValues(alpha: .12)
                : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? theme.primaryColor
                  : Colors.grey.shade300,
              width: selected ? 2.5 : 1,
            ),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: theme.primaryColor.withValues(alpha: .18),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
            ],
          ),
          child: SizedBox(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Text(
                  switch (level) {
                    CertificateLevel.bronze => "🥉",
                    CertificateLevel.silver => "🥈",
                    CertificateLevel.gold => "🥇",
                  },
                  style: const TextStyle(fontSize: 34),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 34,
                  child: Center(
                    child: Text(
                      theme.levelName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: theme.titleColor,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "${theme.minPercentage}-${theme.maxPercentage}%",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(width: 4),
                    Icon(
                      unlocked
                          ? Icons.check_circle
                          : Icons.lock,
                      size: 20,
                      color: unlocked
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}