import 'package:flutter/material.dart';

import 'package:python_quiz/models/quiz_question.dart';
import 'package:python_quiz/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.questions,
    required this.chosenAnswers,
    required this.onRestart,
    required this.onBackHome,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;
  final void Function() onBackHome;
  final List<QuizQuestion> questions;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers.first,
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;

    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    String title;

    if (numCorrectQuestions >= 9) {
      title = "🏆 Excellent!";
    } else if (numCorrectQuestions >= 7) {
      title = "🎉 Great Job!";
    } else if (numCorrectQuestions >= 5) {
      title = "👍 Good Job!";
    } else if (numCorrectQuestions >= 3) {
      title = "📚 Keep Practicing!";
    } else {
      title = "💪 Try Again!";
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 15),
            /// Animated Trophy
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 0.7, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: const Icon(
                Icons.emoji_events,
                size: 85,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 20),
            /// Animated Score Circle
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: .08),
                ),
                child: Text(
                  "$numCorrectQuestions/$numTotalQuestions",
                  style: GoogleFonts.lato(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            /// Title
            Text(
              title,
              style: GoogleFonts.lato(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            /// Description
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(child: QuestionsSummary(summaryData)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: onRestart,
                  icon: Icon(Icons.refresh),
                  label: Text('Restart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: onBackHome,
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
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
