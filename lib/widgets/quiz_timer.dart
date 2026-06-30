import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTimer extends StatelessWidget {
  const QuizTimer({super.key, required this.time, required this.isWarning});

  final String time;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        color: isWarning
            ? Colors.red.withValues(alpha: .15)
            : Colors.amber.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isWarning ? Colors.redAccent : Colors.amber,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer_outlined,
            color: isWarning ? Colors.redAccent : Colors.amber,
          ),

          const SizedBox(width: 10),

          Text(
            time,
            style: GoogleFonts.lato(
              color: isWarning ? Colors.redAccent : Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
