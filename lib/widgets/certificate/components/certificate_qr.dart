import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:python_quiz/models/certificate.dart';

class CertificateQr extends StatelessWidget {
  const CertificateQr({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    final qrData = certificate.verificationUrl?.isNotEmpty == true
        ? certificate.verificationUrl!
        : certificate.certificateId;
    return SizedBox(
      width: 150,
      height: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// QR Card
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(6),
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 68,
                backgroundColor: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text("Verify",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 2),

          Text("Scan QR",
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
