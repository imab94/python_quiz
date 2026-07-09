import 'package:flutter/material.dart';

import '../../models/user_profile.dart';
import 'drawer_header.dart';
import 'drawer_item.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
    required this.profile,
    required this.onEditProfile,
    required this.onSettings,
    required this.onShareApp,
    required this.onRateApp,
    required this.onFeedback,
    required this.onAbout,
  });

  final UserProfile? profile;
  final VoidCallback onEditProfile;
  final VoidCallback onSettings;
  final VoidCallback onRateApp;
  final VoidCallback onFeedback;
  final VoidCallback onShareApp;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .82,
      backgroundColor: Color(0xFF3D0E9E),
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 24),

            DrawerHeaderCard(
              profile: profile,
            ),

            const SizedBox(height: 24),

            Divider(
              color: Colors.white.withValues(alpha: .12),
              indent: 24,
              endIndent: 24,
            ),

            DrawerItem(
              icon: profile == null
                  ? Icons.person_add_alt_1_rounded
                  : Icons.edit_rounded,
              title: profile == null
                  ? "Create Profile"
                  : "Edit Profile",
              onTap: onEditProfile,
            ),

            DrawerItem(
              icon: Icons.settings_rounded,
              title: "Settings",
              onTap: onSettings,
            ),

            DrawerItem(
              icon: Icons.settings_rounded,
              title: "Rate App",
              onTap: onRateApp,
            ),

            DrawerItem(
              icon: Icons.feedback_rounded,
              title: "Send Feedback",
              onTap: onFeedback,
            ),

            DrawerItem(
              icon: Icons.share_rounded,
              title: "Share App",
              onTap: onShareApp,
            ),

            DrawerItem(
              icon: Icons.info_outline_rounded,
              title: "About",
              onTap: onAbout,
            ),

            const Expanded(
              child: SizedBox(),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .55),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}