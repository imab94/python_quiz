import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:python_quiz/models/certificate.dart';

import '../components/certificate_footer_ribbon.dart';
import '../components/certificate_qr.dart';
import '../components/certificate_seal.dart';
import '../components/certificate_signature.dart';

class CertificateFooter extends StatelessWidget {
  const CertificateFooter({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        /// Footer Content
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              /// ==========================
              /// DATE
              /// ==========================
              Expanded(
                flex: 18,
                child: _buildDateSection(),
              ),

              /// ==========================
              /// SEAL
              /// ==========================
              Expanded(
                flex: 18,
                child: Center(
                  child: CertificateSeal(
                    level: certificate.level,
                  ),
                ),
              ),

              /// ==========================
              /// SIGNATURE
              /// ==========================
              Expanded(
                flex: 18,
                child: CertificateSignature(
                  certificate: certificate,
                ),
              ),

              const SizedBox(width: 10),

              /// ==========================
              /// QR
              /// ==========================
              CertificateQr(
                certificate: certificate,
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

      ],
    );
  }

  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Date Issued",
          style: GoogleFonts.lato(
            fontSize: 10,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          certificate.isPreview
              ? "-- --- ----"
              : DateFormat("dd MMM, yyyy").format(
            certificate.issuedDate,
          ),
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: 30,
          height: 1.2,
          color: Colors.grey.shade400,
        ),

        const SizedBox(height: 10),

        Text(
          "Certificate ID",
          style: GoogleFonts.lato(
            fontSize: 11,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          certificate.isPreview
              ? "PY-XXXXXX"
              : certificate.certificateId,
          style: GoogleFonts.lato(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: .8,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
