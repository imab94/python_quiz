import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/certificate.dart';

class CertificateQR extends StatelessWidget {
  const CertificateQR({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: '''
        Certificate ID: ${certificate.certificateId}
        Learner: ${certificate.learnerName}
        Course: ${certificate.courseName}
        Average Score: ${certificate.averageScore.toStringAsFixed(0)}%
    ''',
      version: QrVersions.auto,
      size: 82,
      backgroundColor: Colors.white,
    );
  }
}