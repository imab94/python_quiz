import 'package:flutter/material.dart';

class CertificateFooterRibbon extends StatelessWidget {
  const CertificateFooterRibbon({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      width: double.infinity,
      child: Stack(
        children: [

          /// Gold Wave
          Positioned.fill(
            child: CustomPaint(
              painter: _RibbonPainter(color),
            ),
          ),

          /// Highlight
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: .18,
              child: Container(
                height: 2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RibbonPainter extends CustomPainter {
  _RibbonPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final gold = Paint()
      ..shader = LinearGradient(
        colors: [
          color.withValues(alpha: .85),
          color,
          const Color(0xffFDE68A),
          color,
        ],
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      );

    final path = Path();

    path.moveTo(0, size.height * .55);

    path.quadraticBezierTo(
      size.width * .15,
      size.height * .15,
      size.width * .32,
      size.height * .48,
    );

    path.quadraticBezierTo(
      size.width * .50,
      size.height * .82,
      size.width * .68,
      size.height * .48,
    );

    path.quadraticBezierTo(
      size.width * .86,
      size.height * .12,
      size.width,
      size.height * .55,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, gold);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}