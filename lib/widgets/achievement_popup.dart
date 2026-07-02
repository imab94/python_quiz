import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/achievement.dart';

Future<void> showAchievementPopup({
  required BuildContext context,
  required Achievement achievement,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        backgroundColor: const Color(0xFF2B164D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Icon(
                achievement.icon,
                size: 70,
                color: achievement.color,
              ),

              const SizedBox(height: 20),

              Text(
                "Achievement Unlocked!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                achievement.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: achievement.color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                achievement.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white70,
                  fontSize: 17,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: .15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "+${achievement.xp} XP",
                  style: GoogleFonts.lato(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Awesome!",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}