import 'package:flutter/material.dart';

class CertificateGenerateCard extends StatelessWidget {
  const CertificateGenerateCard({
    super.key,
    required this.topicsCompleted,
    required this.totalTopics,
    required this.quizzesPassed,
    required this.totalQuizzes,
    required this.averageScore,
    required this.isVerified,
    required this.onGenerate,
  });

  final int topicsCompleted;
  final int totalTopics;

  final int quizzesPassed;
  final int totalQuizzes;

  final double averageScore;

  final bool isVerified;

  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: const Color(0xff381f80),
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: Colors.white.withValues(alpha: .08),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Certificate Status",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF6B534).withValues(alpha: .18),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    isVerified
                        ? Icons.verified
                        : Icons.lock,
                    color: isVerified
                        ? Colors.greenAccent
                        : const Color(0xffF6B534),
                    size: 30,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        isVerified
                            ? "Certificate Ready"
                            : "Locked",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isVerified
                              ? Colors.greenAccent
                              : const Color(0xffF6B534),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        isVerified
                            ? "Congratulations! You can now download your certificate."
                            : "Complete all the requirements to unlock your certificate.",
                        style: const TextStyle(
                          color: Colors.white70,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 18),

            Divider(
              color: Colors.white.withValues(alpha: .12),
            ),

            const SizedBox(height: 18),

            _ProgressTile(
              icon: Icons.menu_book_rounded,
              title: "Topics Completed",
              value: topicsCompleted / totalTopics,
              trailing:
              "$topicsCompleted / $totalTopics",
              color: Colors.green,
            ),

            const SizedBox(height: 18),

            _ProgressTile(
              icon: Icons.quiz_rounded,
              title: "Quizzes Passed",
              value: quizzesPassed / totalQuizzes,
              trailing:
              "$quizzesPassed / $totalQuizzes",
              color: Colors.blue,
            ),

            const SizedBox(height: 18),

            _ProgressTile(
              icon: Icons.workspace_premium_rounded,
              title: "Minimum Score",
              value: averageScore / 70,
              trailing:
              "${averageScore.toStringAsFixed(1)} / 70%",
              color: Colors.orange,
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .05),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.white.withValues(alpha: .08),
                ),
              ),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  const Icon(
                    Icons.info_outline,
                    color: Color(0xffF6B534),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      isVerified
                          ? "Your certificate is now officially verified and ready to download."
                          : "Earn at least 70% overall score and complete all topics & quizzes.",
                      style: const TextStyle(
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: isVerified ? onGenerate : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white70,
                  backgroundColor: const Color(0xFF6B46FF),
                  disabledBackgroundColor: const Color(0xFF6B46FF).withValues(alpha: .35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icon(
                  isVerified
                      ? Icons.download_rounded
                      : Icons.lock_outline_rounded,
                  color: Colors.white54,
                ),
                label: const Text(
                  "Generate Certificate",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: Text(
                isVerified
                    ? "Your certificate is ready."
                    : "Available once all requirements are completed.",
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProgressTile extends StatelessWidget {
  const _ProgressTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.trailing,
    required this.color,
  });

  final IconData icon;
  final String title;
  final double value;
  final String trailing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final progress = value.clamp(0.0, 1.0);

    return Row(
      children: [

        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .06),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        Text(
          trailing,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}