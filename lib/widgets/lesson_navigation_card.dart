import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonNavigationCard extends StatelessWidget {
  const LessonNavigationCard({
    super.key,
    this.previousTitle,
    this.nextTitle,
    this.onPrevious,
    this.onNext,
  });

  final String? previousTitle;
  final String? nextTitle;

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    if (previousTitle == null && nextTitle == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Expanded(
          child: previousTitle == null
              ? const SizedBox()
              : OutlinedButton.icon(
            onPressed: onPrevious,
            icon: const Icon(Icons.arrow_back_ios_new),
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Previous",
                  style: GoogleFonts.lato(fontSize: 12),
                ),
                Text(
                  previousTitle!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(
                color: Colors.white.withValues(alpha: .25),
              ),
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: nextTitle == null
              ? const SizedBox()
              : OutlinedButton(
            onPressed: onNext,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.amber,
              side: BorderSide(
                color: Colors.amber.withValues(alpha: .35),
              ),
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Next",
                  style: GoogleFonts.lato(fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  nextTitle!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}