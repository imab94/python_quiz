import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/profile_summary.dart';
import 'package:python_quiz/screens/certificate_center_screen.dart';

class ProfileCertificateSection extends StatelessWidget {
  const ProfileCertificateSection({
    super.key,
    required this.summary,
  });

  final ProfileSummary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        10,
        24,
        24,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white12,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                const Icon(
                  Icons.workspace_premium_rounded,
                  color: Colors.amber,
                  size: 28,
                ),

                const SizedBox(width: 10),

                Text(
                  "Current Certificate",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Text(
              summary.hasCertificate
                  ? "${summary.certificateName} Certificate"
                  : "Certificate Locked",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 22),

            const SizedBox(height: 10),

            Text(
              summary.hasCertificate
                  ? "Congratulations! You've successfully earned your ${summary.certificateName} Certificate."
                  : _lockedMessage(summary),
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 15,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CertificateCenterScreen(),
                    ),
                  );
                },
                icon: Icon(
                  summary.hasCertificate
                      ? Icons.workspace_premium_rounded
                      : Icons.info_outline_rounded,
                ),
                label: Text(
                  summary.hasCertificate
                      ? "View Certificate"
                      : "View Certificate Requirements",
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _lockedMessage(ProfileSummary summary) {
    final missingTopics =
        summary.totalTopics - summary.completedTopics;

    final missingQuizzes =
        summary.totalQuizzes - summary.passedQuizzes;

    if (summary.completedTopics < summary.totalTopics) {
      return "Complete the remaining $missingTopics topic${missingTopics == 1 ? "" : "s"} to unlock your certificate.";
    }

    if (summary.passedQuizzes < summary.totalQuizzes) {
      return "Pass the remaining $missingQuizzes quiz${missingQuizzes == 1 ? "" : "zes"} to unlock your certificate.";
    }

    if (summary.averageScore < 70) {
      return "Increase your course average to at least 70%. Current average: ${summary.averageScore.toStringAsFixed(1)}%.";
    }

    return "You're almost there! Keep learning to unlock your certificate.";
  }
}