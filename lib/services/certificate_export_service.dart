import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:python_quiz/models/certificate.dart';
import 'dart:io';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';


class CertificateExportService {
  /// Capture certificate widget as PNG bytes
  static Future<Uint8List> captureCertificate({
    required GlobalKey repaintKey,
  }) async {
    final boundary = repaintKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    final image = await boundary.toImage(
      pixelRatio: 4.0, // High-quality export
    );

    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    if (byteData == null) {
      throw Exception("Unable to capture certificate.");
    }

    return byteData.buffer.asUint8List();
  }

  /// Save PNG (implementation next)
  /// Save certificate as PNG
  static Future<bool> exportImage({
    required GlobalKey repaintKey,
    required Certificate certificate,
  }) async {
    try {
      final pngBytes = await captureCertificate(
        repaintKey: repaintKey,
      );

      final directory = await getTemporaryDirectory();

      final file = File(
        '${directory.path}/${certificate.certificateId}.png',
      );

      await file.writeAsBytes(pngBytes);

      await Gal.putImage(file.path);

      return true;
    } catch (e) {
      debugPrint('Certificate export failed: $e');
      return false;
    }
  }


  /// Export PDF (implementation later)
  static Future<void> exportPdf({
    required GlobalKey repaintKey,
    required Certificate certificate,
  }) async {
    final pngBytes = await captureCertificate(
      repaintKey: repaintKey,
    );

    // Step 7
    // Convert PNG into a PDF page.
  }
}