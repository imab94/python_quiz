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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.12),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: CertificateLevelCard(
              level: CertificateLevel.bronze,
              selected: selectedLevel == CertificateLevel.bronze,
              unlocked: _isUnlocked(CertificateLevel.bronze),
              onTap: () => onLevelChanged(CertificateLevel.bronze),
            ),
          ),

          const SizedBox(width: 6),

          Expanded(
            child: CertificateLevelCard(
              level: CertificateLevel.silver,
              selected: selectedLevel == CertificateLevel.silver,
              unlocked: _isUnlocked(CertificateLevel.silver),
              onTap: () => onLevelChanged(CertificateLevel.silver),
            ),
          ),

          const SizedBox(width: 6),

          Expanded(
            child: CertificateLevelCard(
              level: CertificateLevel.gold,
              selected: selectedLevel == CertificateLevel.gold,
              unlocked: _isUnlocked(CertificateLevel.gold),
              onTap: () => onLevelChanged(CertificateLevel.gold),
            ),
          ),
        ],
      ),
    );
  }
}