import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:python_quiz/models/certificate.dart';

class CertificateFooter extends StatelessWidget {
  const CertificateFooter({
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

        Divider(
          color: primaryColor.withValues(alpha: .35),
          thickness: 1.2,
        ),

        const SizedBox(height: 28),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            /// Date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Date Issued",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    certificate.isPreview
                        ? "-- --- ----"
                        : DateFormat("dd MMM yyyy")
                        .format(certificate.issuedDate),
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            /// Signature
            Expanded(
              flex: 2,
              child: Column(
                children: [

                  Opacity(
                    opacity: certificate.isPreview ? .35 : 1,
                    child: Image.asset(
                      "assets/images/director_signature.png",
                      width: 150,
                    ),
                  ),

                  Container(
                    width: 170,
                    height: 1.2,
                    color: Colors.grey.shade500,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    certificate.directorName,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    certificate.directorTitle,
                    style: GoogleFonts.lato(
                      color: Colors.grey.shade700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            /// QR Code (Placeholder for now)
            Expanded(
              child: Column(
                children: [

                  Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        certificate.isPreview
                            ? Icons.lock_outline_rounded
                            : Icons.qr_code_2,
                        size: 46,
                        color: certificate.isPreview
                            ? Colors.grey.shade600
                            : Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    certificate.isPreview
                        ? "Locked"
                        : "Verify",
                    style: GoogleFonts.lato(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        Divider(
          color: primaryColor.withValues(alpha: .35),
          thickness: 1.2,
        ),

        const SizedBox(height: 12),

        RichText(
          text: TextSpan(
            style: GoogleFonts.lato(
              color: Colors.black87,
              fontSize: 14,
            ),
            children: [

              const TextSpan(
                text: "Certificate ID : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextSpan(
                text: certificate.isPreview
                    ? "PREVIEW"
                    : certificate.certificateId,
              ),
            ],
          ),
        ),
      ],
    );
  }
}