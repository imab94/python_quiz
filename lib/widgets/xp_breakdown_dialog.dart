import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/services/xp_service.dart';

class XPBreakdownDialog extends StatefulWidget {
  const XPBreakdownDialog({super.key});

  @override
  State<XPBreakdownDialog> createState() =>
      _XPBreakdownDialogState();
}

class _XPBreakdownDialogState
    extends State<XPBreakdownDialog> {

  int totalXP = 0;
  int achievementXP = 0;
  int activityXP = 0;

  @override
  void initState() {
    super.initState();
    loadXP();
  }

  Future<void> loadXP() async {
    totalXP = await XPService.getTotalXP();
    achievementXP =
    await XPService.getAchievementXP();
    activityXP =
    await XPService.getActivityXP();

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF2B124C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Icon(
              Icons.stars_rounded,
              color: Colors.amber,
              size: 64,
            ),

            const SizedBox(height: 16),

            Text(
              "XP Breakdown",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            _buildXPRow(
              icon: Icons.star,
              title: "Total XP",
              value: totalXP,
              color: Colors.amber,
            ),

            const Divider(
              color: Colors.white24,
              height: 32,
            ),

            _buildXPRow(
              icon: Icons.emoji_events,
              title: "Achievement XP",
              value: achievementXP,
              color: Colors.greenAccent,
            ),

            const SizedBox(height: 14),

            _buildXPRow(
              icon: Icons.school,
              title: "Activity XP",
              value: activityXP,
              color: Colors.lightBlueAccent,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildXPRow({
    required IconData icon,
    required String title,
    required int value,
    required Color color,
  }) {
    return Row(
      children: [

        Icon(
          icon,
          color: color,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),

        Text(
          "+$value",
          style: GoogleFonts.lato(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}