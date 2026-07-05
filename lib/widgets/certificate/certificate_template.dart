import 'package:flutter/material.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/models/certificate_theme.dart';

import 'package:python_quiz/widgets/certificate/certificate_background.dart';
import 'package:python_quiz/widgets/certificate/certificate_border.dart';
import 'package:python_quiz/widgets/certificate/certificate_landscape.dart';

import 'package:python_quiz/widgets/certificate/sections/certificate_header.dart';
import 'package:python_quiz/widgets/certificate/sections/certificate_recipient.dart';
import 'package:python_quiz/widgets/certificate/sections/certificate_body.dart';
import 'package:python_quiz/widgets/certificate/sections/certificate_footer.dart';

import 'certificate_watermark.dart';

class CertificateTemplate extends StatelessWidget {
  const CertificateTemplate({
    super.key,
    required this.certificate,
    this.repaintKey,
  });

  final Certificate certificate;
  final GlobalKey? repaintKey;

  @override
  Widget build(BuildContext context) {
    final theme = CertificateThemes.fromLevel(certificate.level);

    return RepaintBoundary(
      key: repaintKey,
      child: CertificateLandscape(
        certificate: certificate,
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Background
            CertificateBackground(theme: theme),

            /// Decorative Border
            CertificateBorder(theme: theme, child: const SizedBox.expand()),

            /// ===========================
            /// Header
            /// ===========================
            Positioned(
              top: 10,
              left: 70,
              right: 70,
              child: CertificateHeader(certificate: certificate, theme: theme),
            ),

            /// ===========================
            /// Recipient
            /// ===========================
            Positioned(
              top: 270,
              left: 80,
              right: 80,
              child: CertificateRecipient(
                certificate: certificate,
                theme: theme,
              ),
            ),

            /// ===========================
            /// Body
            /// ===========================
            Positioned(
              top: 415,
              left: 120,
              right: 120,
              child: CertificateBody(certificate: certificate, theme: theme),
            ),

            /// ===========================
            /// Footer
            /// ===========================
            Positioned(
              top: 664,
              left: 80,
              right: 50,
              bottom: 50,
              child: CertificateFooter(
                certificate: certificate,
              ),
            ),

            /// ===========================
            /// Preview Watermark
            /// ===========================
            if (certificate.isPreview)
              const Positioned.fill(
                child: IgnorePointer(
                    child: CertificateWatermark()
                ),
              ),
          ],
        ),
      ),
    );
  }
}
