import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateBody extends StatelessWidget {
  const CertificateBody({
    super.key,
    required this.certificate,
    required this.theme,
  });

  final Certificate certificate;
  final CertificateThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "For Successfully Completing",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          certificate.courseName.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: theme.titleColor,
            letterSpacing: 1,
            height: 1,
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: 320,
          child: Row(
            children: [

              Expanded(
                child: Divider(
                  thickness: 1.3,
                  color: theme.primaryColor.withValues(alpha: .40),
                ),
              ),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.workspace_premium_rounded,
                  color: theme.primaryColor,
                  size: 18,
                ),
              ),

              Expanded(
                child: Divider(
                  thickness: 1.3,
                  color: theme.primaryColor.withValues(alpha: .40),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 5),

        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 55),
          child: Text(
            "This certificate is proudly awarded in recognition of the successful completion of the Python Mastery Program. The recipient has demonstrated strong understanding of Python fundamentals, object-oriented programming, exception handling, file handling, asynchronous programming, testing, design patterns, and modern Python development practices.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 15,
              height: 1.8,
              color: Colors.grey.shade800,
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          "Congratulations on this outstanding achievement!",
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontStyle: FontStyle.italic,
            color: theme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}