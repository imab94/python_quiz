import 'package:flutter/material.dart';

import '../../models/certificate.dart';
import 'certificate_border.dart';

class CertificateLandscape extends StatelessWidget {
  const CertificateLandscape({
    super.key,
    required this.certificate,
    required this.child,
  });

  final Certificate certificate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.414, // A4 Landscape

        child: CertificateBorder(
          level: certificate.level,

          child: child,
        ),
      ),
    );
  }
}