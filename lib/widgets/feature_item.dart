import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.amber, size: 18),

          const SizedBox(height: 10),

          Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
