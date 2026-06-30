import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizProgressCard extends StatelessWidget {
  const QuizProgressCard({
    super.key,
    required this.title,
    required this.level,
    required this.status,
    required this.statusColor,

    required this.primaryActionText,
    required this.onPrimaryTap,

    this.secondaryActionText,
    this.onSecondaryTap,
  });

  final String title;
  final String level;
  final String status;
  final Color statusColor;

  final String primaryActionText;
  final VoidCallback onPrimaryTap;

  final String? secondaryActionText;
  final VoidCallback? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
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
            style: GoogleFonts.lato(color: Colors.white60, fontSize: 14),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Icon(Icons.circle, size: 11, color: statusColor),

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

          const SizedBox(height: 18),

          Divider(color: Colors.white.withValues(alpha: .08)),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onPrimaryTap,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(primaryActionText),
                ),
              ),

              if (secondaryActionText != null) ...[
                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: onSecondaryTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(secondaryActionText!),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
