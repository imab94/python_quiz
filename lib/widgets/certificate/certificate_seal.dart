import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/certificate.dart';

class CertificateSeal extends StatelessWidget {
  const CertificateSeal({
    super.key,
    required this.level,
  });

  final CertificateLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = _theme();

    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.backgroundColor,
        border: Border.all(
          color: theme.primaryColor,
          width: 5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withValues(alpha: .20),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.primaryColor.withValues(alpha: .45),
              width: 2,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "★★★★★",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 10,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "PYTHON",
                style: GoogleFonts.lato(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              Text(
                "LEARNING",
                style: GoogleFonts.lato(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "PLATFORM",
                style: GoogleFonts.lato(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Icon(
                Icons.code,
                color: theme.primaryColor,
                size: 34,
              ),

              const SizedBox(height: 8),

              Text(
                _levelText(),
                style: GoogleFonts.lato(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
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

  _SealTheme _theme() {
    switch (level) {
      case CertificateLevel.gold:
        return _SealTheme(
          Colors.amber.shade700,
          Colors.amber.shade50,
        );

      case CertificateLevel.silver:
        return _SealTheme(
          Colors.grey.shade600,
          Colors.grey.shade200,
        );

      case CertificateLevel.bronze:
        return _SealTheme(
          const Color(0xffA97142),
          const Color(0xffF6E4D4),
        );
    }
  }
}

class _SealTheme {
  final Color primaryColor;
  final Color backgroundColor;

  const _SealTheme(
      this.primaryColor,
      this.backgroundColor,
      );
}