import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateHeader extends StatelessWidget {
  const CertificateHeader({
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

        /// Logo
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: theme.primaryColor,
              width: 2.2,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withValues(alpha: .15),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            Icons.code_rounded,
            size: 37,
            color: theme.primaryColor,
          ),
        ),

        const SizedBox(height: 15),

        Text(
          certificate.organizationName.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            color: theme.primaryColor,
          ),
        ),

        const SizedBox(height: 15),

        Row(
          children: [

            Expanded(
              child: Divider(
                thickness: 1.2,
                color: theme.primaryColor.withValues(alpha: .40),
                indent: 10,
                endIndent: 12,
              ),
            ),

            Icon(
              Icons.auto_awesome,
              size: 18,
              color: theme.primaryColor,
            ),

            Expanded(
              child: Divider(
                thickness: 1.2,
                color: theme.primaryColor.withValues(alpha: .40),
                indent: 12,
                endIndent: 10,
              ),
            ),
          ],
        ),

        const SizedBox(height: 3),

        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.secondaryColor,
                theme.primaryColor,
              ],
            ).createShader(bounds);
          },
          child: Text(
            "CERTIFICATE",
            style: GoogleFonts.cinzel(
              color: Colors.white,
              fontSize: 58,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
        ),

        const SizedBox(height: 1),

        Text(
          "OF ACHIEVEMENT",
          style: GoogleFonts.cinzel(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            letterSpacing: 6,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: 350,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                theme.primaryColor.withValues(alpha: .65),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}