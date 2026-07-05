import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/certificate.dart';

class CertificateQr extends StatelessWidget {
  const CertificateQr({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// QR Card
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: certificate.isPreview
                ? Icon(
              Icons.lock_outline_rounded,
              size: 28,
              color: Colors.grey.shade500,
            )
                : Padding(
              padding: const EdgeInsets.all(8),
              child: CustomPaint(
                painter: _FakeQrPainter(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            certificate.isPreview
                ? "Preview"
                : "Verify",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            certificate.isPreview
                ? "Locked"
                : "Scan QR",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 9,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class _FakeQrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;

    final cell = size.width / 12;

    void square(int x, int y, int w, int h) {
      canvas.drawRect(
        Rect.fromLTWH(
          x * cell,
          y * cell,
          w * cell,
          h * cell,
        ),
        paint,
      );
    }

    // Finder patterns
    square(0, 0, 3, 3);
    square(1, 1, 1, 1);

    square(9, 0, 3, 3);
    square(10, 1, 1, 1);

    square(0, 9, 3, 3);
    square(1, 10, 1, 1);

    // Random blocks
    square(5, 4, 1, 2);
    square(7, 6, 2, 1);
    square(4, 8, 1, 1);
    square(8, 8, 1, 2);
    square(6, 10, 2, 1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}