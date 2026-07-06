import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateHomeCard extends StatelessWidget {
  const CertificateHomeCard({
    super.key,
    required this.completedTopics,
    required this.totalTopics,
    required this.isVerified,
    required this.onTap,
  });

  final int completedTopics;
  final int totalTopics;
  final bool isVerified;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final progress = totalTopics == 0
        ? 0.0
        : (completedTopics / totalTopics).clamp(0.0, 1.0);

    final progressPercentage = (progress * 100).round();

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .08),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.white.withValues(alpha: .10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .12),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            /// =========================
            /// Certificate Icon
            /// =========================
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                isVerified
                    ? Icons.workspace_premium_rounded
                    : Icons.lock_outline_rounded,
                color: Colors.amber,
                size: 34,
              ),
            ),

            const SizedBox(width: 18),

            /// =========================
            /// Certificate Information
            /// =========================
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title + Status
                  Row(
                    children: [
                      Text(
                        "Certificate",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 10),

                      _CertificateStatusBadge(
                        isVerified: isVerified,
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    isVerified
                        ? "Congratulations! Certificate unlocked"
                        : "Earn an official Python certificate",
                    style: GoogleFonts.lato(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// Progress + Percentage
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: isVerified ? 1.0 : progress,
                            minHeight: 8,
                            backgroundColor: Colors.white12,
                            color: isVerified
                                ? Colors.green
                                : Colors.amber,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Text(
                        isVerified ? "100%" : "$progressPercentage%",
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    isVerified
                        ? "Ready to Generate"
                        : "$completedTopics / $totalTopics Topics Completed",
                    style: GoogleFonts.lato(
                      color: isVerified
                          ? Colors.greenAccent
                          : Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

            /// =========================
            /// Navigation Arrow
            /// =========================
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateStatusBadge extends StatelessWidget {
  const _CertificateStatusBadge({
    required this.isVerified,
  });

  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    final color = isVerified
        ? Colors.greenAccent
        : Colors.orangeAccent;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .14),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: .35),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isVerified
                ? Icons.check_circle_rounded
                : Icons.lock_outline_rounded,
            color: color,
            size: 13,
          ),
          const SizedBox(width: 4),
          Text(
            isVerified ? "Unlocked" : "Locked",
            style: GoogleFonts.lato(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}