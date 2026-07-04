import 'package:python_quiz/models/certificate.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CertificateExportService {

  static Future<void> exportPdf({
    required Certificate certificate,
  }) async {

  }

  static Future<void> exportImage({
    required Certificate certificate,
  }) async {

  }

  static Future<Uint8List> captureCertificate({
    required GlobalKey repaintKey,
  }) async {

    final boundary =
    repaintKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    final image = await boundary.toImage(
      pixelRatio: 4,
    );

    final byteData =
    await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    if (byteData == null) {
      throw Exception(
        "Unable to capture certificate.",
      );
    }

    return byteData.buffer.asUint8List();
  }

}