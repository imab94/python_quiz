import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateMiniStat extends StatelessWidget {
  const CertificateMiniStat({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}