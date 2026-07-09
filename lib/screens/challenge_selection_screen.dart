import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/screens/challenge_quiz_screen.dart';
import 'package:python_quiz/services/challenge_question_service.dart';


class ChallengeSelectionScreen extends StatelessWidget {
  const ChallengeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  "Python Challenges",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [

                    _challengeCard(
                      context,
                      icon: Icons.school,
                      color: Colors.greenAccent,
                      title: "Beginner Challenge",
                      subtitle:
                      "10 Random Questions\nBeginner Topics",
                      level: ChallengeLevel.beginner,
                    ),

                    const SizedBox(height: 18),

                    _challengeCard(
                      context,
                      icon: Icons.auto_graph,
                      color: Colors.orangeAccent,
                      title: "Intermediate Challenge",
                      subtitle:
                      "15 Random Questions\nIntermediate Topics",
                      level: ChallengeLevel.intermediate,
                    ),

                    const SizedBox(height: 18),

                    _challengeCard(
                      context,
                      icon: Icons.workspace_premium,
                      color: Colors.redAccent,
                      title: "Advanced Challenge",
                      subtitle:
                      "20 Random Questions\nAdvanced Topics",
                      level: ChallengeLevel.advanced,
                    ),

                    const SizedBox(height: 18),

                    _challengeCard(
                      context,
                      icon: Icons.bolt,
                      color: Colors.amber,
                      title: "Mixed Challenge",
                      subtitle:
                      "30 Random Questions\nAll Topics",
                      level: ChallengeLevel.mixed,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _challengeCard(
      BuildContext context, {
        required IconData icon,
        required Color color,
        required String title,
        required String subtitle,
        required ChallengeLevel level,
      }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChallengeQuizScreen(
              level: level,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .06),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.white12,
          ),
        ),
        child: Row(
          children: [

            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    subtitle,
                    style: GoogleFonts.lato(
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}