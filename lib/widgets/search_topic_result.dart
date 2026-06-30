import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTopicResult extends StatelessWidget {
  const SearchTopicResult({
    super.key,
    required this.title,
    required this.level,
    required this.onTap,
  });

  final String title;
  final String level;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withValues(alpha: .08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(Icons.menu_book, color: Colors.white),
        ),
        title: Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(level, style: GoogleFonts.lato(color: Colors.amber)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white70,
          size: 18,
        ),
      ),
    );
  }
}
