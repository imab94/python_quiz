import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:confetti/confetti.dart';
import 'package:python_quiz/screens/certificate_center_screen.dart';
import 'package:python_quiz/screens/challenge_selection_screen.dart';

class CourseCompletionScreen extends StatefulWidget {
  const CourseCompletionScreen({
    super.key,
    required this.topicsCompleted,
    required this.totalTopics,
    required this.quizzesPassed,
    required this.averageScore,
    required this.certificateName,
    required this.learnerName,
  });

  final int topicsCompleted;
  final int totalTopics;
  final int quizzesPassed;
  final double averageScore;
  final String certificateName;
  final String learnerName;

  @override
  State<CourseCompletionScreen> createState() => _CourseCompletionScreenState();

}

class _CourseCompletionScreenState
    extends State<CourseCompletionScreen>
    with SingleTickerProviderStateMixin {

  late final ConfettiController _confettiController;
  late final AnimationController _trophyController;
  late final Animation<double> _trophyAnimation;


  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );

    _confettiController.play();

    _trophyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _trophyAnimation = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _trophyController,
        curve: Curves.easeInOut,
      ),
    );

    _trophyController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _trophyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    ScaleTransition(
                      scale: _trophyAnimation,
                      child: Container(
                        width: 82,
                        height: 82,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber.withValues(alpha: .15),
                          border: Border.all(
                            color: Colors.amber.withValues(alpha: .35),
                          ),
                        ),
                        child: const Icon(
                          Icons.workspace_premium_rounded,
                          color: Colors.amber,
                          size: 42,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "🎉 Congratulations,\n$widget.learnerName!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "You've completed the Python Learning Path",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .05),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: _certificateColor.withValues(alpha: .35),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _certificateEmoji,
                            style: const TextStyle(fontSize: 36),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.certificateName} Certificate",
                                  style: GoogleFonts.lato(
                                    color: _certificateColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Successfully Earned",
                                  style: GoogleFonts.lato(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    Expanded(
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.25,
                        children: [
                          _achievementCard(
                            icon: Icons.menu_book_rounded,
                            value: "${widget.topicsCompleted}/${widget.totalTopics}",
                            label: "Topics",
                            color: Colors.amber,
                          ),
                          _achievementCard(
                            icon: Icons.quiz_rounded,
                            value: "${widget.quizzesPassed}",
                            label: "Quizzes",
                            color: Colors.lightBlueAccent,
                          ),
                          _achievementCard(
                            icon: Icons.workspace_premium_rounded,
                            value: widget.certificateName,
                            label: "Certificate",
                            color: Colors.greenAccent,
                          ),
                          _achievementCard(
                            icon: Icons.analytics_rounded,
                            value: "${widget.averageScore.toStringAsFixed(1)}%",
                            label: "Average",
                            color: Colors.orangeAccent,
                          ),
                        ],
                      ),
                    ),

                    Text(
                      "Keep learning. Keep building. Keep growing.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CertificateCenterScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.workspace_premium_rounded),
                        label: const Text("View Certificate"),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ChallengeSelectionScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.bolt),
                        label: const Text("Take Random Challenge"),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.home_rounded),
                        label: const Text("Back Home"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Top Left Confetti
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 0.8,
              emissionFrequency: 0.05,
              numberOfParticles: 12,
              gravity: 0.18,
              shouldLoop: false,
            ),
          ),

          /// Top Right Confetti
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 2.3,
              emissionFrequency: 0.05,
              numberOfParticles: 12,
              gravity: 0.18,
              shouldLoop: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _achievementCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: color,
            size: 30,
          ),

          const SizedBox(height: 14),

          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            label,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  String get _certificateEmoji {
    switch (widget.certificateName.toLowerCase()) {
      case "gold":
        return "🥇";
      case "silver":
        return "🥈";
      default:
        return "🥉";
    }
  }

  Color get _certificateColor {
    switch (widget.certificateName.toLowerCase()) {
      case "gold":
        return Colors.amber;

      case "silver":
        return Colors.grey.shade300;

      default:
        return const Color(0xFFCD7F32);
    }
  }
}