import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/widgets/certificate/certificate_level_card.dart';

class CertificateRewardCard extends StatelessWidget {
  const CertificateRewardCard({
    super.key,
    required this.selectedLevel,
    required this.earnedLevel,
    required this.onLevelChanged,
  });

  final CertificateLevel selectedLevel;
  final CertificateLevel earnedLevel;
  final ValueChanged<CertificateLevel> onLevelChanged;

  bool _isUnlocked(CertificateLevel level) {
    return level.index <= earnedLevel.index;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Certificate Gallery",
              style: GoogleFonts.lato(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Preview every certificate level before unlocking it.",
              style: GoogleFonts.lato(
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 22),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CertificateLevelCard(
                  level: CertificateLevel.bronze,
                  selected:
                  selectedLevel == CertificateLevel.bronze,
                  unlocked:
                  _isUnlocked(CertificateLevel.bronze),
                  onTap: () {
                    onLevelChanged(
                      CertificateLevel.bronze,
                    );
                  },
                ),
                const SizedBox(width: 10),
                CertificateLevelCard(
                  level: CertificateLevel.silver,
                  selected:
                  selectedLevel == CertificateLevel.silver,
                  unlocked:
                  _isUnlocked(CertificateLevel.silver),
                  onTap: () {
                    onLevelChanged(
                      CertificateLevel.silver,
                    );
                  },
                ),
                const SizedBox(width: 10),
                CertificateLevelCard(
                  level: CertificateLevel.gold,
                  selected:
                  selectedLevel == CertificateLevel.gold,
                  unlocked:
                  _isUnlocked(CertificateLevel.gold),
                  onTap: () {
                    onLevelChanged(
                      CertificateLevel.gold,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}