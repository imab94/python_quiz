import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/widgets/certificate/certificate_header.dart';
import 'package:python_quiz/widgets/certificate/certificate_student.dart';
import 'certificate_landscape.dart';
import 'package:python_quiz/widgets/certificate/certificate_footer.dart';
import 'package:python_quiz/widgets/certificate/certificate_left_stats.dart';
import 'package:python_quiz/widgets/certificate/certificate_right_stats.dart';
import 'package:python_quiz/widgets/certificate/certificate_seal.dart';
import 'package:python_quiz/widgets/certificate/certificate_lock_banner.dart';


class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    super.key,
    required this.certificate,
    this.repaintKey,
  });

  final Certificate certificate;
  final GlobalKey? repaintKey;

  @override
  Widget build(BuildContext context) {
    final theme = _themeForLevel(certificate.level);

    return RepaintBoundary(
      key: repaintKey,
      child: Stack(
        alignment: Alignment.center,
        children: [

          /// Entire certificate
          Opacity(
            opacity: certificate.isPreview ? .55 : 1,
            child: CertificateLandscape(
              certificate: certificate,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      CertificateHeader(
                        level: certificate.level,
                        primaryColor: theme.primaryColor,
                      ),

                      const SizedBox(height: 36),

                      CertificateStudent(
                        certificate: certificate,
                        primaryColor: theme.primaryColor,
                      ),

                      if (certificate.isPreview)
                        const CertificateLockBanner(),

                      const SizedBox(height: 36),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                            child: CertificateLeftStats(
                              certificate: certificate,
                              primaryColor: theme.primaryColor,
                            ),
                          ),

                          const SizedBox(width: 40),

                          CertificateSeal(
                            level: certificate.level,
                          ),

                          const SizedBox(width: 40),

                          Expanded(
                            child: CertificateRightStats(
                              certificate: certificate,
                              primaryColor: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 36),

                      CertificateFooter(
                        certificate: certificate,
                        primaryColor: theme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// Watermark
          if (certificate.isPreview)
            IgnorePointer(
              child: Transform.rotate(
                angle: -.45,
                child: Opacity(
                  opacity: .08,
                  child: Text(
                    "PREVIEW",
                    style: GoogleFonts.lato(
                      fontSize: 160,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                      letterSpacing: 10,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  _CertificateTheme _themeForLevel(
      CertificateLevel level,
      ) {
    switch (level) {

      case CertificateLevel.gold:
        return const _CertificateTheme(
          Colors.amber,
          "GOLD CERTIFICATE",
        );

      case CertificateLevel.silver:
        return const _CertificateTheme(
          Colors.grey,
          "SILVER CERTIFICATE",
        );

      case CertificateLevel.bronze:
        return const _CertificateTheme(
          Color(0xffB87333),
          "BRONZE CERTIFICATE",
        );
    }
  }
}

class _CertificateTheme {

  final Color primaryColor;
  final String title;

  const _CertificateTheme(
      this.primaryColor,
      this.title,
      );
}