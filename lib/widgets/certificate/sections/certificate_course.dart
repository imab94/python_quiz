import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateCourse extends StatelessWidget {
  const CertificateCourse({
    super.key,
    required this.certificate,
    required this.theme,
  });

  final Certificate certificate;
  final CertificateThemeData theme;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          "For successfully completing",
          style: GoogleFonts.lato(
            color: Colors.grey.shade700,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          certificate.courseName,
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: theme.titleColor,
          ),
        ),

        const SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            "This certificate recognizes outstanding performance in Python programming through successful completion of all learning modules, quizzes and assessments.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              height: 1.6,
              fontSize: 15,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }
}