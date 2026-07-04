import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateLockBanner extends StatelessWidget {
  const CertificateLockBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 28,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.orange.withValues(alpha: .35),
        ),
      ),
      child: Column(
        children: [

          const Icon(
            Icons.lock_rounded,
            size: 38,
            color: Colors.orange,
          ),

          const SizedBox(height: 12),

          Text(
            "CERTIFICATE LOCKED",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.orange.shade800,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            "Complete all learning topics,\n"
                "pass every topic quiz and maintain\n"
                "at least a 70% average score\nto unlock this certificate.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.black87,
              height: 1.6,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}