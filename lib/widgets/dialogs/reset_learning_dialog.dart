import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/services/reset_learning_service.dart';
import 'package:python_quiz/services/app_refresh_service.dart';

class ResetLearningDialog extends StatefulWidget {
  const ResetLearningDialog({
    super.key,
  });

  @override
  State<ResetLearningDialog> createState() =>
      _ResetLearningDialogState();
}

class _ResetLearningDialogState
    extends State<ResetLearningDialog> {

  bool _resetting = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1E2235),
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
          MediaQuery.of(context).size.height * .82,
        ),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: Colors.white10,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange.withValues(alpha: .15),
              ),
              child: const Icon(
                Icons.warning_amber_rounded,
                color: Colors.deepOrangeAccent,
                size: 52,
              ),
            ),

            const SizedBox(height: 22),

            Text(
              "Reset Learning Progress",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "This action permanently removes your learning progress and cannot be undone.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 15,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 28),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: .10),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.redAccent.withValues(alpha: .45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.redAccent,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "will be deleted",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [

                      _chip(
                        icon: Icons.star_rounded,
                        title: "XP & Level",
                        color: Colors.amber,
                      ),

                      _chip(
                        icon: Icons.menu_book_rounded,
                        title: "Topics",
                        color: Colors.lightBlueAccent,
                      ),

                      _chip(
                        icon: Icons.quiz_rounded,
                        title: "Quiz Results",
                        color: Colors.orangeAccent,
                      ),

                      _chip(
                        icon: Icons.emoji_events_rounded,
                        title: "Achievements",
                        color: Colors.amberAccent,
                      ),

                      _chip(
                        icon: Icons.local_fire_department_rounded,
                        title: "Streak",
                        color: Colors.deepOrangeAccent,
                      ),

                      _chip(
                        icon: Icons.workspace_premium_rounded,
                        title: "Certificates",
                        color: Colors.yellow,
                      ),

                      _chip(
                        icon: Icons.notifications_active_rounded,
                        title: "Notifications",
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withValues(alpha: .10),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.greenAccent.withValues(alpha: .45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      const Icon(
                        Icons.verified_user_rounded,
                        color: Colors.greenAccent,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "will remain safe",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [

                      _chip(
                        icon: Icons.person,
                        title: "Profile",
                        color: Colors.lightBlueAccent,
                      ),

                      _chip(
                        icon: Icons.photo_camera,
                        title: "Photo",
                        color: Colors.pinkAccent,
                      ),

                      _chip(
                        icon: Icons.flag,
                        title: "Country",
                        color: Colors.greenAccent,
                      ),

                      _chip(
                        icon: Icons.badge,
                        title: "Profile ID",
                        color: Colors.deepPurpleAccent,
                      ),

                      _chip(
                        icon: Icons.calendar_today,
                        title: "Joined Date",
                        color: Colors.orangeAccent,
                      ),

                      _chip(
                        icon: Icons.notifications_none_rounded,
                        title: "Reminders",
                        color: Colors.cyanAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            const Divider(
              color: Colors.white12,
            ),

            const SizedBox(height: 22),

            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white24,
                      ),
                      minimumSize: const Size(
                        double.infinity,
                        52,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.deepOrangeAccent,
                          Colors.redAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: _resetting
                          ? null
                          : () async {

                        setState(() {
                          _resetting = true;
                        });

                        await Future.delayed(
                          const Duration(milliseconds: 700),
                        );

                        await ResetLearningService.resetAll();

// Tell the whole app to refresh
                        AppRefreshService.refresh();

                        if (!mounted) return;

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            content: Row(
                              children: const [

                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    "Learning progress reset successfully.",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      icon: _resetting
                          ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                          : const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        _resetting
                            ? "Resetting..."
                            : "Reset Progress",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
      ),
    );
  }
  Widget _chip({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(
            icon,
            size: 18,
            color: color,
          ),

          const SizedBox(width: 8),

          Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

}