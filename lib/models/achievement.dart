import 'package:flutter/material.dart';

class Achievement {
  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.xp,
  });

  final String id;

  final String title;

  final String description;

  final IconData icon;

  final Color color;

  final int xp;
}
