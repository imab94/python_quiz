
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:python_quiz/models/certificate.dart';

class CertificateExportService {
  /// Capture the rendered certificate as high-resolution PNG bytes.
  static Future<Uint8List> captureCertificate({
    required GlobalKey repaintKey,
  }) async {
    final context = repaintKey.currentContext;

    if (context == null) {
      throw StateError('Certificate widget is not available.');
    }

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderRepaintBoundary) {
      throw StateError('Certificate is not ready for export.');
    }

    if (renderObject.debugNeedsPaint) {
      await Future<void>.delayed(
        const Duration(milliseconds: 20),
      );
    }

    final image = await renderObject.toImage(pixelRatio: 4.0);

    try {
      final byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        throw StateError('Unable to capture certificate.');
      }

      return byteData.buffer.asUint8List();
    } finally {
      image.dispose();
    }
  }

  /// Save the rendered certificate as a PNG in the device gallery.
  ///
  /// Keeps the existing method signature and return type.
  static Future<bool> exportImage({
    required GlobalKey repaintKey,
    required Certificate certificate,
  }) async {
    try {
      if (certificate.isPreview || !certificate.isVerified) {
        return false;
      }

      final pngBytes = await captureCertificate(
        repaintKey: repaintKey,
      );

      final directory = await getTemporaryDirectory();
      final safeId = _safeFileName(certificate.certificateId);
      final file = File('${directory.path}/$safeId.png');

      await file.writeAsBytes(pngBytes, flush: true);

      await Gal.putImage(file.path);

      return true;
    } catch (error, stackTrace) {
      debugPrint('Certificate PNG export failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  }

  /// Create a PDF containing the same rendered certificate.
  ///
  /// Returns the PDF bytes so the caller can save or share them.
  static Future<Uint8List> createPdfBytes({
    required GlobalKey repaintKey,
    required Certificate certificate,
  }) async {
    if (certificate.isPreview || !certificate.isVerified) {
      throw StateError(
        'Only an earned certificate can be exported.',
      );
    }

    final pngBytes = await captureCertificate(
      repaintKey: repaintKey,
    );

    final document = pw.Document();
    final image = pw.MemoryImage(pngBytes);

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(12),
        build: (context) {
          return pw.Center(
            child: pw.Image(
              image,
              fit: pw.BoxFit.contain,
            ),
          );
        },
      ),
    );

    return document.save();
  }

  /// Open the system print/share dialog with the generated PDF.
  static Future<void> exportPdf({
    required GlobalKey repaintKey,
    required Certificate certificate,
  }) async {
    final pdfBytes = await createPdfBytes(
      repaintKey: repaintKey,
      certificate: certificate,
    );

    await Printing.layoutPdf(
      onLayout: (_) async => pdfBytes,
      name: '${_safeFileName(certificate.certificateId)}.pdf',
      format: PdfPageFormat.a4.landscape,
    );
  }

  static String _safeFileName(String value) {
    final cleaned = value.replaceAll(
      RegExp(r'[^a-zA-Z0-9_-]'),
      '_',
    );

    return cleaned.isEmpty ? 'python_certificate' : cleaned;
  }
}
