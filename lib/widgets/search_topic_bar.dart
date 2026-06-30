import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTopicBar extends StatelessWidget {
  const SearchTopicBar({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white24),
      ),
      child: TextField(
        onChanged: onChanged,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.amber,
          ),
          hintText: "Search topics...",
          hintStyle: GoogleFonts.lato(
            color: Colors.white54,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }
}