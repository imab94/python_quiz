import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

class CertificateMedal extends StatelessWidget {
  const CertificateMedal({
    super.key,
    required this.level,
  });

  final CertificateLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = CertificateThemes.fromLevel(level);

    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Ribbon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              _Ribbon(
                gradient: theme.ribbonGradient,
              ),

              const SizedBox(width: 10),

              _Ribbon(
                gradient: theme.ribbonGradient,
              ),
            ],
          ),

          Transform.translate(
            offset: const Offset(0, -8),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: theme.medalGradient,
                border: Border.all(
                  color: theme.borderColor,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: .28),
                    blurRadius: 22,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .75),
                    width: 2,
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.workspace_premium_rounded,
                      size: 34,
                      color: theme.titleColor,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      theme.levelName.toUpperCase(),
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: theme.titleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Ribbon extends StatelessWidget {
  const _Ribbon({
    required this.gradient,
  });

  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _RibbonClipper(),
      child: Container(
        width: 22,
        height: 50,
        decoration: BoxDecoration(
          gradient: gradient,
        ),
      ),
    );
  }
}

class _RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    final path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width / 2, size.height - 10);

    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}