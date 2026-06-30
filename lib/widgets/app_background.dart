import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  Widget _floatingSymbol({
    required String symbol,
    required double top,
    required double left,
    double size = 28,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: IgnorePointer(
        child: Text(
          symbol,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .1),
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _star({
    required double top,
    required double left,
    double size = 8,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .1),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF140152), Color(0xFF3D0E9E), Color(0xFF6A1FD0)],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
          children: [
            Positioned(
              top: -100,
              left: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: .05),
                ),
              ),
            ),
            Positioned(
              bottom: -120,
              right: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: .03),
                ),
              ),
            ),
            _floatingSymbol(
              symbol: "{ }",
              top: 90,
              left: 35,
              size: 28,
            ),
            _floatingSymbol(
              symbol: "</>",
              top: 180,
              left: 285,
              size: 24,
            ),
            _floatingSymbol(
              symbol: "( )",
              top: 320,
              left: 55,
            ),
            _floatingSymbol(
              symbol: "[ ]",
              top: 520,
              left: 290,
            ),
            _floatingSymbol(
              symbol: "λ",
              top: 670,
              left: 60,
              size: 26,
            ),
            _floatingSymbol(
              symbol: "def",
              top: 760,
              left: 250,
              size: 22,
            ),
            _star(top: 60, left: 250),
            _star(top: 145, left: 180),
            _star(top: 260, left: 100),
            _star(top: 340, left: 330),
            _star(top: 480, left: 210),
            _star(top: 610, left: 170),
            _star(top: 730, left: 320),
            _star(top: 820, left: 120),
            child,
          ],
      ),
    );
  }
}
