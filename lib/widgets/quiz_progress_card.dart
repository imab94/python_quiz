import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizProgressCard extends StatelessWidget {
  const QuizProgressCard({
    super.key,
    required this.title,
    required this.level,
    required this.status,
    required this.statusColor,
    required this.actionText,
    required this.onTap,
  });

  final String title;
  final String level;
  final String status;
  final Color statusColor;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withValues(alpha: .08),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  level,
                  style: GoogleFonts.lato(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 11,
                      color: statusColor,
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        status,
                        style: GoogleFonts.lato(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Divider(
                  color: Colors.white.withValues(alpha: .08),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      actionText,
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}