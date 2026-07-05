import 'package:flutter/material.dart';

import 'package:python_quiz/models/certificate_theme.dart';

class CertificateBorder extends StatelessWidget {
  const CertificateBorder({
    super.key,
    required this.theme,
    required this.child,
  });

  final CertificateThemeData theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CertificateBorderPainter(theme),
      child: child,
    );
  }
}

class _CertificateBorderPainter extends CustomPainter {
  const _CertificateBorderPainter(this.theme);

  final CertificateThemeData theme;

  @override
  void paint(Canvas canvas, Size size) {
    final outer = Paint()
      ..color = theme.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final middle = Paint()
      ..color = theme.primaryColor.withOpacity(.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final inner = Paint()
      ..color = theme.primaryColor.withOpacity(.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const outerGap = 24.0;
    const middleGap = 38.0;
    const innerGap = 50.0;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          outerGap,
          outerGap,
          size.width - outerGap * 2,
          size.height - outerGap * 2,
        ),
        const Radius.circular(6),
      ),
      outer,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          middleGap,
          middleGap,
          size.width - middleGap * 2,
          size.height - middleGap * 2,
        ),
        const Radius.circular(4),
      ),
      middle,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          innerGap,
          innerGap,
          size.width - innerGap * 2,
          size.height - innerGap * 2,
        ),
        const Radius.circular(2),
      ),
      inner,
    );

    _drawCorner(
      canvas,
      const Offset(58, 58),
      false,
      false,
    );

    _drawCorner(
      canvas,
      Offset(size.width - 58, 58),
      true,
      false,
    );

    _drawCorner(
      canvas,
      Offset(58, size.height - 58),
      false,
      true,
    );

    _drawCorner(
      canvas,
      Offset(size.width - 58, size.height - 58),
      true,
      true,
    );
  }

  void _drawCorner(
      Canvas canvas,
      Offset origin,
      bool flipX,
      bool flipY,
      ) {
    canvas.save();

    canvas.translate(origin.dx, origin.dy);

    canvas.scale(
      flipX ? -1 : 1,
      flipY ? -1 : 1,
    );

    final paint = Paint()
      ..color = theme.primaryColor.withOpacity(.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    final light = Paint()
      ..color = theme.primaryColor.withOpacity(.30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawLine(
      const Offset(0, 18),
      const Offset(0, 0),
      paint,
    );

    canvas.drawLine(
      const Offset(0, 0),
      const Offset(18, 0),
      paint,
    );

    canvas.drawArc(
      const Rect.fromLTWH(0, 0, 28, 28),
      3.14159,
      1.5708,
      false,
      paint,
    );

    canvas.drawArc(
      const Rect.fromLTWH(8, 8, 12, 12),
      3.14159,
      1.5708,
      false,
      light,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}