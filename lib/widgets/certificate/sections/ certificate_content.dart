import 'package:flutter/material.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

import 'certificate_header.dart';
import 'certificate_recipient.dart';
import 'certificate_course.dart';
import 'certificate_stats.dart';

class CertificateContent extends StatelessWidget {
  const CertificateContent({
    super.key,
    required this.certificate,
    required this.theme,
  });

  final Certificate certificate;
  final CertificateThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Header
        CertificateHeader(
          certificate: certificate,
          theme: theme,
        ),

        const SizedBox(height: 26),

        /// Recipient
        CertificateRecipient(
          certificate: certificate,
          theme: theme,
        ),

        const SizedBox(height: 28),

        /// Course + Description
        CertificateCourse(
          certificate: certificate,
          theme: theme,
        ),

        const Spacer(),

        /// Statistics
        CertificateStats(
          certificate: certificate,
          theme: theme,
        ),
      ],
    );
  }
}