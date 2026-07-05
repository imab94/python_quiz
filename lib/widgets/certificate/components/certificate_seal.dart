import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateSeal extends StatelessWidget {
  const CertificateSeal({
    super.key,
    required this.level,
  });

  final CertificateLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = CertificateThemes.fromLevel(level);

    return SizedBox(
      width: 105,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Ribbon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width: 18,
                height: 26,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.primaryColor,
                      theme.borderColor,
                    ],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(3),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Container(
                width: 18,
                height: 26,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.primaryColor,
                      theme.borderColor,
                    ],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(3),
                  ),
                ),
              ),
            ],
          ),

          Transform.translate(
            offset: const Offset(0, -10),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white,
                    theme.secondaryColor,
                    theme.primaryColor,
                  ],
                ),
                border: Border.all(
                  color: theme.borderColor,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: .30),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.workspace_premium_rounded,
                    size: 28,
                    color: theme.titleColor,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    _levelText(),
                    style: GoogleFonts.lato(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                      color: theme.titleColor,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    "CERTIFIED",
                    style: GoogleFonts.lato(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                      color: theme.titleColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _levelText() {
    switch (level) {
      case CertificateLevel.gold:
        return "GOLD";
      case CertificateLevel.silver:
        return "SILVER";
      case CertificateLevel.bronze:
        return "BRONZE";
    }
  }
}