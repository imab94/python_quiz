import 'package:flutter/material.dart';
import 'package:python_quiz/models/certificate.dart';

class CertificateBorder extends StatelessWidget {
  const CertificateBorder({
    super.key,
    required this.level,
    required this.child,
  });

  final CertificateLevel level;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = _theme(level);

    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,

        borderRadius: BorderRadius.circular(28),

        border: Border.all(
          color: theme.primaryColor,
          width: 6,
        ),

        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withValues(alpha: .18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),

            border: Border.all(
              color: theme.secondaryColor,
              width: 1.5,
            ),
          ),
          child: Stack(
            children: [

              /// Main certificate
              Padding(
                padding: const EdgeInsets.all(30),
                child: child,
              ),

              /// Top Left Ornament
              Positioned(
                top: 14,
                left: 14,
                child: _CornerDecoration(
                  color: theme.primaryColor,
                ),
              ),

              /// Top Right Ornament
              Positioned(
                top: 14,
                right: 14,
                child: Transform.rotate(
                  angle: 1.57,
                  child: _CornerDecoration(
                    color: theme.primaryColor,
                  ),
                ),
              ),

              /// Bottom Left Ornament
              Positioned(
                bottom: 14,
                left: 14,
                child: Transform.rotate(
                  angle: -1.57,
                  child: _CornerDecoration(
                    color: theme.primaryColor,
                  ),
                ),
              ),

              /// Bottom Right Ornament
              Positioned(
                bottom: 14,
                right: 14,
                child: Transform.rotate(
                  angle: 3.14,
                  child: _CornerDecoration(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _CertificateTheme _theme(CertificateLevel level) {
    switch (level) {
      case CertificateLevel.gold:
        return const _CertificateTheme(
          primaryColor: Color(0xFFD4AF37),
          secondaryColor: Color(0xFFE8C75F),
          backgroundColor: Color(0xFFFFFCF3),
        );

      case CertificateLevel.silver:
        return const _CertificateTheme(
          primaryColor: Color(0xFF9E9E9E),
          secondaryColor: Color(0xFFD6D6D6),
          backgroundColor: Color(0xFFFDFDFD),
        );

      case CertificateLevel.bronze:
        return const _CertificateTheme(
          primaryColor: Color(0xFFB87333),
          secondaryColor: Color(0xFFD89A63),
          backgroundColor: Color(0xFFFFF9F4),
        );
    }
  }
}

class _CornerDecoration extends StatelessWidget {
  const _CornerDecoration({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.auto_awesome,
      color: color.withValues(alpha: .55),
      size: 26,
    );
  }
}

class _CertificateTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  const _CertificateTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });
}