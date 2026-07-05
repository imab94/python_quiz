import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateRecipient extends StatelessWidget {
  const CertificateRecipient({
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
          "THIS CERTIFICATE IS PROUDLY PRESENTED TO",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 3.2,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          certificate.learnerName.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: theme.titleColor,
            height: 1,
          ),
        ),

        const SizedBox(height: 15),

        Row(
          children: [

            Expanded(
              child: Container(
                height: 1.2,
                margin: const EdgeInsets.only(right: 18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      theme.primaryColor.withValues(alpha: .60),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
              ),
            ),

            Expanded(
              child: Container(
                height: 1.2,
                margin: const EdgeInsets.only(left: 18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      theme.primaryColor.withValues(alpha: .60),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            "In recognition of exceptional dedication, perseverance, and successful completion of the Python learning program.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 16,
              height: 1.7,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}