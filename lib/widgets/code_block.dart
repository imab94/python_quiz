import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key, required this.title, required this.code});

  final String title;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Section Title + Copy Button
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                color: Colors.amber,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),
            IconButton(
              tooltip: "Copy",
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Copied to clipboard"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.copy_rounded, color: Colors.white),
            ),
          ],
        ),

        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: .25),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white24),
          ),
          child: SelectableText(
            code,
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
