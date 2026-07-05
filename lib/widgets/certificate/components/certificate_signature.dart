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
          const SizedBox(height: 6),
          /// Signature Image
          SizedBox(
            height: 20,
            width: 230,
            child:OverflowBox(
            maxWidth: 250,
            maxHeight: 80,
            child: Image.asset(
              "assets/images/director_signature.png",
              width: 220,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
            ),
        ],
      ),
    );
  }
}