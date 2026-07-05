import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/certificate.dart';

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

        /// Student Name
        Text(
          certificate.learnerName.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.cinzel(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          width: 360,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                primaryColor,
                Colors.transparent,
              ],
            ),
          ),
        ),

        const SizedBox(height: 28),

        Text(
          "FOR SUCCESSFULLY COMPLETING",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            fontSize: 15,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          certificate.courseName,
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 18),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          child: Text(
            "This certifies that the learner has successfully completed the course requirements and demonstrated strong knowledge of Python programming, problem solving, object-oriented programming, file handling, testing and modern development practices.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 15,
              height: 1.7,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}