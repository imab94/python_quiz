import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/user_profile.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profile,
  });

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        28,
        24,
        18,
      ),
      child: Column(
        children: [

          CircleAvatar(
            radius: 56,
            backgroundColor: Colors.white12,
            backgroundImage: profile.photoPath != null
                ? FileImage(
              File(profile.photoPath!),
            )
                : null,
            child: profile.photoPath == null
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 68,
            )
                : null,
          ),

          const SizedBox(height: 18),

          Text(
            profile.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "${profile.countryFlag} ${profile.country}",
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withValues(alpha: .20),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.deepPurpleAccent,
              ),
            ),
            child: Text(
              "👨‍💻 Python Learner",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [

              Expanded(
                child: _infoTile(
                  "Joined",
                  _formatDate(profile.createdAt),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _infoTile(
                  "Profile ID",
                  "",
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () async {
                      await Clipboard.setData(
                        ClipboardData(
                          text: profile.profileId,
                        ),
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Profile ID copied"),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Flexible(
                          child: Text(
                            _shortProfileId(profile.profileId),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),

                        const Icon(
                          Icons.copy_rounded,
                          color: Colors.white70,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTile(
      String title,
      String value, {
        Widget? child,
      }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Column(
        children: [

          Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.white60,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 8),

          child ??
              Text(
                value,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat("dd MMM yyyy").format(date);
  }

  String _shortProfileId(String id) {

    if (id.length <= 12) {
      return id;
    }

    return "${id.substring(0, 8)}...${id.substring(id.length - 4)}";
  }
}