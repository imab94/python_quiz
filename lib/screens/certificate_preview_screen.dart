import 'package:flutter/material.dart';

import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/widgets/certificate/certificate_template.dart';
import 'package:python_quiz/services/certificate_export_service.dart';

class CertificatePreviewScreen extends StatefulWidget {
  const CertificatePreviewScreen({
    super.key,
    required this.certificate,
  });

  final Certificate certificate;

  @override
  State<CertificatePreviewScreen> createState() =>
      _CertificatePreviewScreenState();
}


class _CertificatePreviewScreenState
    extends State<CertificatePreviewScreen> {

  final GlobalKey _certificateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161616),

      appBar: AppBar(
        title: const Text("Certificate Preview"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [

          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () async {

              final bytes =
              await CertificateExportService.captureCertificate(
                repaintKey: _certificateKey,
              );

              debugPrint(
                "Captured Image Size: ${bytes.length} bytes",
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: InteractiveViewer(
          minScale: .5,
          maxScale: 3,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: CertificateWidget(
                  certificate: widget.certificate,
                  repaintKey: _certificateKey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}