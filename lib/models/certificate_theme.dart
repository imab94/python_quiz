import 'package:flutter/material.dart';
import 'package:python_quiz/models/certificate.dart';

class CertificateThemeData {
  final Color primaryColor;
  final Color secondaryColor;
  final Color borderColor;
  final Color titleColor;
  final Color textColor;
  final Color sealColor;

  final String levelName;

  final int minPercentage;
  final int maxPercentage;

  final Color backgroundColor;
  final Color cardBackgroundColor;

  final Gradient ribbonGradient;
  final Gradient medalGradient;

  const CertificateThemeData({
    required this.primaryColor,
    required this.secondaryColor,
    required this.borderColor,
    required this.titleColor,
    required this.textColor,
    required this.sealColor,
    required this.levelName,
    required this.minPercentage,
    required this.maxPercentage,

    required this.backgroundColor,
    required this.cardBackgroundColor,
    required this.medalGradient,
    required this.ribbonGradient,
  });
}

class CertificateThemes {
    static CertificateThemeData fromLevel(
        CertificateLevel level,
        ) {
      switch (level) {
        case CertificateLevel.gold:
          return gold;

        case CertificateLevel.silver:
          return silver;

        case CertificateLevel.bronze:
          return bronze;
      }
    }

  static const bronze = CertificateThemeData(
      levelName: "Bronze",

      primaryColor: Color(0xFFB87333),
      secondaryColor: Color(0xFFD29A63),
      borderColor: Color(0xFF8C5523),
      titleColor: Color(0xFF8C5523),
      textColor: Colors.black87,
      sealColor: Color(0xFFB87333),

      minPercentage: 70,
      maxPercentage: 84,
    backgroundColor: Color(0xffFFFCF7),
    cardBackgroundColor: Colors.white,

    ribbonGradient: LinearGradient(
      colors: [
        Color(0xff8C5523),
        Color(0xffD29A63),
        Color(0xffB87333),
      ],
    ),

    medalGradient: LinearGradient(
      colors: [
        Color(0xffF5D2AE),
        Color(0xffB87333),
      ],
    ),
  );

  static const silver = CertificateThemeData(
      levelName: "Silver",

      primaryColor: Color(0xFFC0C0C0),
      secondaryColor: Color(0xFFE3E3E3),
      borderColor: Color(0xFF8E8E8E),
      titleColor: Color(0xFF6E6E6E),
      textColor: Colors.black87,
      sealColor: Color(0xFFC0C0C0),

      minPercentage: 85,
      maxPercentage: 94,
    backgroundColor: Color(0xffFCFCFC),
    cardBackgroundColor: Colors.white,

    ribbonGradient: LinearGradient(
      colors: [
        Color(0xff9E9E9E),
        Color(0xffE3E3E3),
        Color(0xffBDBDBD),
      ],
    ),

    medalGradient: LinearGradient(
      colors: [
        Color(0xffF5F5F5),
        Color(0xffC0C0C0),
      ],
    ),
  );

  static const gold = CertificateThemeData(
      levelName: "Gold",

      primaryColor: Color(0xFFD4AF37),
      secondaryColor: Color(0xFFFFE082),
      borderColor: Color(0xFFB8860B),
      titleColor: Color(0xFF996515),
      textColor: Colors.black87,
      sealColor: Color(0xFFD4AF37),

      minPercentage: 95,
      maxPercentage: 100,
    backgroundColor: Color(0xffFFFDF8),
    cardBackgroundColor: Colors.white,

    ribbonGradient: LinearGradient(
      colors: [
        Color(0xffB8860B),
        Color(0xffFFE082),
        Color(0xffD4AF37),
      ],
    ),

    medalGradient: LinearGradient(
      colors: [
        Color(0xffFFF4B2),
        Color(0xffD4AF37),
      ],
    ),
  );
}