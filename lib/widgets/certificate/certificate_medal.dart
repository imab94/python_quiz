import 'package:flutter/material.dart';
import '../../models/certificate.dart';

class CertificateMedal extends StatelessWidget {
  const CertificateMedal({
    super.key,
    required this.level,
  });

  final CertificateLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = _theme(level);

    return Stack(
      alignment: Alignment.center,
      children: [

        /// Left Ribbon
        Positioned(
          top: 48,
          left: 26,
          child: _Ribbon(
            color: theme.ribbonColor,
            left: true,
          ),
        ),

        /// Right Ribbon
        Positioned(
          top: 48,
          right: 26,
          child: _Ribbon(
            color: theme.ribbonColor,
            left: false,
          ),
        ),

        /// Medal
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                theme.lightColor,
                theme.primaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withValues(alpha: .35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .95),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/python-logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _MedalTheme _theme(CertificateLevel level) {
    switch (level) {
      case CertificateLevel.gold:
        return const _MedalTheme(
          primaryColor: Color(0xffD4AF37),
          lightColor: Color(0xffF8E28A),
          ribbonColor: Color(0xffA71D31),
        );

      case CertificateLevel.silver:
        return const _MedalTheme(
          primaryColor: Color(0xffA7A7A7),
          lightColor: Color(0xffE4E4E4),
          ribbonColor: Color(0xff5C6BC0),
        );

      case CertificateLevel.bronze:
        return const _MedalTheme(
          primaryColor: Color(0xffB87333),
          lightColor: Color(0xffD8A375),
          ribbonColor: Color(0xff7B3F00),
        );
    }
  }
}

class _Ribbon extends StatelessWidget {
  const _Ribbon({
    required this.color,
    required this.left,
  });

  final Color color;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: left ? -.25 : .25,
      child: Container(
        width: 24,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}

class _MedalTheme {
  final Color primaryColor;
  final Color lightColor;
  final Color ribbonColor;

  const _MedalTheme({
    required this.primaryColor,
    required this.lightColor,
    required this.ribbonColor,
  });
}