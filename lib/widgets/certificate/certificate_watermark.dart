import 'package:flutter/material.dart';

class CertificateWatermark extends StatelessWidget {
  const CertificateWatermark({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: 0.06,
        child: Stack(
          children: const [
            _WatermarkText(
              top: 250,
              left: 90,
              angle: -0.45,
            ),
            _WatermarkText(
              top: 360,
              left: 430,
              angle: -0.45,
            ),
            _WatermarkText(
              top: 550,
              left: 770,
              angle: -0.45,
            ),
          ],
        ),
      ),
    );
  }
}

class _WatermarkText extends StatelessWidget {
  const _WatermarkText({
    required this.top,
    required this.left,
    required this.angle,
  });

  final double top;
  final double left;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child: Text(
          "PREVIEW",
          style: TextStyle(
            fontSize: 110,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 10,
          ),
        ),
      ),
    );
  }
}