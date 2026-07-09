import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/models/user_profile.dart';
import 'package:python_quiz/services/profile_service.dart';
import 'package:python_quiz/widgets/profile/profile_header.dart';
import 'package:python_quiz/widgets/profile/profile_stats_section.dart';
import 'package:python_quiz/widgets/profile/profile_certificate_section.dart';
import 'package:python_quiz/widgets/profile/profile_learning_progress.dart';
import '../models/profile_summary.dart';
import '../services/profile_summary_service.dart';

class LearnerProfileScreen extends StatefulWidget {
  const LearnerProfileScreen({
    super.key,
  });

  @override
  State<LearnerProfileScreen> createState() => _LearnerProfileScreenState();
}

class _LearnerProfileScreenState extends State<LearnerProfileScreen> {
  UserProfile? _profile;
  bool _loading = true;
  ProfileSummary? _summary;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {

    final profileFuture =
    ProfileService.getProfile();

    final summaryFuture =
    ProfileSummaryService.load();

    final results = await Future.wait([
      profileFuture,
      summaryFuture,
    ]);

    final profile = results[0] as UserProfile?;
    final summary = results[1] as ProfileSummary;

    if (!mounted) return;

    setState(() {
      _profile = profile;
      _summary = summary;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  16,
                  18,
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
                      "Learner Profile",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Divider(
                color: Colors.white12,
                indent: 24,
                endIndent: 24,
              ),

              const SizedBox(height: 24),

              Expanded(
                child: _loading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : _profile == null
                    ? Center(
                  child: Text(
                    "No Profile Found",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
                    : SingleChildScrollView(
                  padding:  EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [

                      ProfileHeader(
                        profile: _profile!,
                      ),

                      const SizedBox(height: 12),

                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(
                          color: Colors.white12,
                          height: 1,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ProfileStatsSection(
                        summary: _summary!,
                      ),

                      ProfileLearningProgress(
                        summary: _summary!,
                      ),

                       ProfileCertificateSection(
                        summary: _summary!,
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}