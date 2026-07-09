import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/user_profile.dart';

class DrawerHeaderCard extends StatelessWidget {
  const DrawerHeaderCard({
    super.key,
    required this.profile,
  });

  final UserProfile? profile;

  @override
  Widget build(BuildContext context) {
    final hasProfile = profile != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 22),
      child: Column(
        children: [

          CircleAvatar(
            radius: 46,
            backgroundColor: Colors.white12,
            backgroundImage: hasProfile &&
                profile!.photoPath != null
                ? FileImage(File(profile!.photoPath!))
                : null,
            child: hasProfile || profile?.photoPath != null
                ? null
                : const Icon(
              Icons.person,
              size: 46,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            hasProfile
                ? profile!.name
                : "Guest Learner",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            hasProfile
                ? "${profile!.countryFlag} ${profile!.country}"
                : "Complete your learner profile",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}