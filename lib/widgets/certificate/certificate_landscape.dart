import 'package:flutter/material.dart';
import 'package:python_quiz/models/certificate.dart';

class CertificateLandscape extends StatelessWidget {
  const CertificateLandscape({
    super.key,
    required this.child,
    required this.certificate,
  });

  final Widget child;
  final Certificate certificate;

  static const double canvasWidth = 1200;
  static const double canvasHeight = 850;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: SizedBox(
              width: canvasWidth,
              height: canvasHeight,
              child: Material(
                color: const Color(0xffFCFBF8),
                elevation: 12,
                shadowColor: Colors.black26,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
