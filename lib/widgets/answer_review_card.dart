import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/quiz_question.dart';

class AnswerReviewCard extends StatelessWidget {
  const AnswerReviewCard({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.selectedAnswer,
  });

  final int questionNumber;
  final QuizQuestion question;
  final String selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final correct =
        selectedAnswer == question.answers.first;

    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              "Question $questionNumber",
              style: GoogleFonts.lato(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              question.text,
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Icon(
                  correct
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: correct
                      ? Colors.greenAccent
                      : Colors.redAccent,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    selectedAnswer,
                    style: GoogleFonts.lato(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}