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
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xff4F2DBA)
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
            height: 104,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  switch (level) {
                    CertificateLevel.bronze => "🥉",
                    CertificateLevel.silver => "🥈",
                    CertificateLevel.gold => "🥇",
                  },
                  style: const TextStyle(fontSize: 15),
                ),

                const SizedBox(height: 2),

                Text(
                  theme.levelName,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: selected
                        ? Colors.white
                        : theme.titleColor,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  "${theme.minPercentage}-${theme.maxPercentage}%",
                  style: GoogleFonts.lato(
                    fontSize: 11,
                    color: selected
                        ? Colors.white70
                        : Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 4),

                Icon(
                  unlocked
                      ? Icons.check_circle
                      : Icons.lock_outline_rounded,
                  color: selected
                      ? Colors.white
                      : unlocked
                      ? Colors.green
                      : Colors.grey,
                  size: 18,
                ),
              ],
            )
          ),
      ),
    );
  }
}