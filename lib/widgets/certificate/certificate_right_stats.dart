import 'package:flutter/material.dart';

import '../../models/certificate.dart';
import 'certificate_stat_item.dart';

class CertificateRightStats extends StatelessWidget {
  const CertificateRightStats({
    super.key,
    required this.certificate,
    required this.primaryColor,
  });

  final Certificate certificate;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CertificateMiniStat(
          icon: Icons.analytics_rounded,
          value:
          "${certificate.averageScore.toStringAsFixed(0)}%",
          title: "Average",
          color: primaryColor,
        ),

        const SizedBox(height: 26),

        CertificateMiniStat(
          icon: Icons.workspace_premium_rounded,
          value: certificate.level.name.toUpperCase(),
          title: "Certificate",
          color: primaryColor,
        ),
      ],
    );
  }
}