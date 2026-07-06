import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/widgets/feature_item.dart';

class WhyPythonCard extends StatelessWidget {
  const WhyPythonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why Learn Python?",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Python is one of the world's most popular programming languages.",
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          const Row(
            children: [
              Expanded(
                child: FeatureItem(icon: Icons.school_rounded, title: "Easy"),
              ),

              SizedBox(width: 12),

              Expanded(
                child: FeatureItem(icon: Icons.speed_rounded, title: "Fast"),
              ),
            ],
          ),

          SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: FeatureItem(icon: Icons.work_rounded, title: "Career"),
              ),

              SizedBox(width: 12),

              Expanded(
                child: FeatureItem(
                  icon: Icons.public_rounded,
                  title: "Community",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
