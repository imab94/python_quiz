import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/certificate.dart';

class CertificatePreviewCard extends StatelessWidget {
  const CertificatePreviewCard({
    super.key,
    required this.level,
    required this.isEligible,
    this.onPreview,
  });

  final CertificateLevel level;
  final bool isEligible;
  final VoidCallback? onPreview;

  @override
  Widget build(BuildContext context) {

    final medal = switch (level) {
      CertificateLevel.bronze => "🥉",
      CertificateLevel.silver => "🥈",
      CertificateLevel.gold => "🥇",
    };

    final title = switch (level) {
      CertificateLevel.bronze => "Bronze Certificate",
      CertificateLevel.silver => "Silver Certificate",
      CertificateLevel.gold => "Gold Certificate",
    };

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Column(
        children: [

          Text(
            "Certificate Preview",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            medal,
            style: const TextStyle(fontSize: 64),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            isEligible
                ? "Congratulations! Your certificate is ready."
                : "Complete all requirements to unlock your certificate.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white70,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: isEligible ? onPreview : null,
              icon: const Icon(Icons.visibility),
              label: Text(
                isEligible
                    ? "View Certificate"
                    : "Preview Design",
              ),
            ),
          ),
        ],
      ),
    );
  }
}