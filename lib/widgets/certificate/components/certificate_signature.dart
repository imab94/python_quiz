import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';

class CertificateSignature extends StatelessWidget {
  const CertificateSignature({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Signature Image
          SizedBox(
            height: 42,
            child: certificate.isPreview
                ? Opacity(
              opacity: .60,
              child: Text(
                "Signature",
                style: GoogleFonts.dancingScript(
                  fontSize: 30,
                  color: Colors.grey.shade500,
                ),
              ),
            )
                : Image.asset(
              "assets/images/director_signature.png",
              height: 42,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 6),

          /// Signature Line
          Container(
            width: 150,
            height: 1.2,
            color: Colors.grey.shade500,
          ),

          const SizedBox(height: 8),

          Text(
            certificate.directorName,
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            certificate.directorTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 11,
              color: Colors.grey.shade600,
              letterSpacing: .4,
            ),
          ),
        ],
      ),
    );
  }
}