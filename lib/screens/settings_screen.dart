import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/screens/reminder_preferences_screen.dart';
import 'package:python_quiz/widgets/settings/settings_tile.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/screens/learner_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  12,
                ),
                child: Row(
                  children: [

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "Settings",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(
                color: Colors.white12,
                height: 1,
              ),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  children: [

                    SettingsTile(
                      icon: Icons.person_outline_rounded,
                      title: "Profile",
                      subtitle: "Manage your learner profile",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LearnerProfileScreen(),
                          ),
                        );
                      },
                    ),

                    SettingsTile(
                      icon: Icons.settings_applications,
                      title: "Learning Remainders",
                      subtitle: "Manage reminders and alerts",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ReminderPreferencesScreen(),
                          ),
                        );
                      },
                    ),

                    SettingsTile(
                      icon: Icons.workspace_premium_outlined,
                      title: "Certificates",
                      subtitle: "View certification settings",
                      onTap: () {},
                    ),

                    SettingsTile(
                      icon: Icons.delete_outline_rounded,
                      title: "Reset Learning Progress",
                      subtitle: "Clear all progress and start again",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}