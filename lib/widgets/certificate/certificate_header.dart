import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/certificate.dart';
import 'certificate_medal.dart';

class CertificateHeader extends StatelessWidget {
  const CertificateHeader({
    super.key,
    required this.level,
    required this.primaryColor,
  });

  final CertificateLevel level;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Medal
        CertificateMedal(level: level),

        const SizedBox(height: 24),

        Text(
          "PYTHON LEARNING PLATFORM",
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade700,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          "CERTIFICATE",
          style: GoogleFonts.playfairDisplay(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          "OF COMPLETION",
          style: GoogleFonts.lato(
            fontSize: 17,
            letterSpacing: 8,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 28),

        Row(
          children: [

            Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      primaryColor.withValues(alpha: .65),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Icon(
              Icons.auto_awesome,
              color: primaryColor,
              size: 18,
            ),

            const SizedBox(width: 8),

            Icon(
              Icons.workspace_premium,
              color: primaryColor,
              size: 24,
            ),

            const SizedBox(width: 8),

            Icon(
              Icons.auto_awesome,
              color: primaryColor,
              size: 18,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor.withValues(alpha: .65),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}