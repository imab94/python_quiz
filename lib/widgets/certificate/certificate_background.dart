import 'package:flutter/material.dart';

import 'package:python_quiz/models/certificate_theme.dart';

class CertificateBackground extends StatelessWidget {
  const CertificateBackground({
    super.key,
    required this.theme,
  });

  final CertificateThemeData theme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// Base paper
          Container(
            color: theme.backgroundColor,
          ),

          /// Top Left Ribbon
          Positioned(
            left: -220,
            top: -220,
            child: _RibbonCircle(
              size: 520,
              gradient: theme.ribbonGradient,
              opacity: .96,
            ),
          ),

          Positioned(
            left: -110,
            top: -110,
            child: _RibbonCircle(
              size: 320,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(.95),
                  Colors.transparent,
                ],
              ),
              opacity: .95,
            ),
          ),

          /// Bottom Right Ribbon
          Positioned(
            right: -220,
            bottom: -220,
            child: _RibbonCircle(
              size: 520,
              gradient: theme.ribbonGradient,
              opacity: .96,
            ),
          ),

          Positioned(
            right: -110,
            bottom: -110,
            child: _RibbonCircle(
              size: 320,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(.95),
                  Colors.transparent,
                ],
              ),
              opacity: .95,
            ),
          ),

          /// Center Glow
          Center(
            child: Container(
              width: 980,
              height: 680,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  radius: .9,
                  colors: [
                    Colors.white.withOpacity(.92),
                    Colors.white.withOpacity(.55),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// Decorative Diagonal Lines
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _TexturePainter(),
              ),
            ),
          ),

          /// Corner Decoration
          const Positioned(
            top: 35,
            left: 35,
            child: _CornerDecoration(),
          ),

          const Positioned(
            top: 35,
            right: 35,
            child: RotatedBox(
              quarterTurns: 1,
              child: _CornerDecoration(),
            ),
          ),

          const Positioned(
            bottom: 35,
            left: 35,
            child: RotatedBox(
              quarterTurns: 3,
              child: _CornerDecoration(),
            ),
          ),

          const Positioned(
            bottom: 35,
            right: 35,
            child: RotatedBox(
              quarterTurns: 2,
              child: _CornerDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}

class _RibbonCircle extends StatelessWidget {
  const _RibbonCircle({
    required this.size,
    required this.gradient,
    required this.opacity,
  });

  final double size;
  final Gradient gradient;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
        ),
      ),
    );
  }
}

class _CornerDecoration extends StatelessWidget {
  const _CornerDecoration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: CustomPaint(
        painter: _CornerPainter(),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(.10)
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(0, 25),
      const Offset(0, 0),
      paint,
    );

    canvas.drawLine(
      const Offset(0, 0),
      const Offset(25, 0),
      paint,
    );

    canvas.drawArc(
      const Rect.fromLTWH(0, 0, 34, 34),
      3.14,
      1.57,
      false,
      paint,
    );

    canvas.drawArc(
      const Rect.fromLTWH(8, 8, 18, 18),
      3.14,
      1.57,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _TexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(.03)
      ..strokeWidth = 1;

    const gap = 24.0;

    for (double i = -size.height; i < size.width; i += gap) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }

    final vertical = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..strokeWidth = 1;

    for (double x = 0; x < size.width; x += 36) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        vertical,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}