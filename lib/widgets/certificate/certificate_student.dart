import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/certificate.dart';

class CertificateStudent extends StatelessWidget {
  const CertificateStudent({
    super.key,
    required this.certificate,
    required this.primaryColor,
  });

  final Certificate certificate;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          "This certifies that",
          style: GoogleFonts.lato(
            fontSize: 18,
            color: Colors.grey.shade700,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 20),

        Row(
          children: [

            Expanded(
              child: Divider(
                color: primaryColor.withValues(alpha: .35),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.auto_awesome,
                color: primaryColor,
                size: 18,
              ),
            ),

            Expanded(
              child: Divider(
                color: primaryColor.withValues(alpha: .35),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Text(
          certificate.learnerName,
          textAlign: TextAlign.center,
          style: GoogleFonts.dancingScript(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 16),

        Container(
          width: 320,
          height: 1.5,
          color: primaryColor.withValues(alpha: .35),
        ),

        const SizedBox(height: 22),

        Text(
          "has successfully completed the",
          style: GoogleFonts.lato(
            fontSize: 18,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          "Python Learning Path",
          style: GoogleFonts.playfairDisplay(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          "including all learning modules and assessments",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 15,
            color: Colors.grey.shade600,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}