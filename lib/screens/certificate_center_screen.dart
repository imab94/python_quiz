import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/services/certificate_service.dart';
import 'package:python_quiz/widgets/certificate/certificate_reward_card.dart';
import 'package:python_quiz/widgets/certificate/certificate_template.dart';
import 'package:python_quiz/widgets/certificate/certificate_generate_card.dart';

import '../services/certificate_export_service.dart';

class CertificateCenterScreen extends StatefulWidget {
  const CertificateCenterScreen({super.key});

  @override
  State<CertificateCenterScreen> createState() =>
      _CertificateCenterScreenState();
}

class _CertificateCenterScreenState
    extends State<CertificateCenterScreen> {

  bool _isLoading = true;

  bool _isEligible = false;

  Certificate? _certificate;
  final GlobalKey _certificateKey = GlobalKey();

  CertificateLevel _selectedLevel = CertificateLevel.bronze;
  CertificateLevel _earnedLevel = CertificateLevel.bronze;

  @override
  void initState() {
    super.initState();
    _loadCertificateProgress();
  }

  Future<void> _loadCertificateProgress() async {

    final eligible =
    await CertificateService.isEligible();

    final level =
    await CertificateService.getCertificateLevel();

    _earnedLevel = level;
    _selectedLevel = level;

    final certificate =
    await CertificateService.generateCertificate(
      learnerName: "John Doe",
    );

    if (!mounted) return;

    setState(() {
      _isEligible = eligible;
      _certificate = certificate;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final certificate = (_certificate ?? _previewFor(_selectedLevel)).copyWith(
      level: _selectedLevel,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Python Certification",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Become a Certified Python Developer",
                  style: GoogleFonts.lato(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: _isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : SingleChildScrollView(
                    child: Column(
                      children: [
                        CertificateRewardCard(
                          selectedLevel: _selectedLevel,
                          earnedLevel: _earnedLevel,
                          onLevelChanged: (level) {
                            setState(() {
                              _selectedLevel = level;
                            });
                          },
                        ),

                        const SizedBox(height: 24),

                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 900,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: AnimatedScale(
                                scale: 1,
                                duration: const Duration(milliseconds: 250),
                                child: AspectRatio(
                                  key: ValueKey(_selectedLevel),
                                  aspectRatio: 1200 / 850,
                                  child: SizedBox(
                                    height: 320,
                                    child: CertificateTemplate(
                                      repaintKey: _certificateKey,
                                      certificate: certificate,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        CertificateGenerateCard(
                          selectedLevel: _selectedLevel,
                          earnedLevel: _earnedLevel,
                          isVerified: certificate.isVerified,
                          onGenerate: () async {

                            if (_certificateKey.currentContext == null) return;

                            final path =
                            await CertificateExportService.exportImage(
                              repaintKey: _certificateKey,
                              certificate: certificate,
                            );

                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  path == null
                                      ? "Unable to generate certificate."
                                      : "Certificate saved successfully.",
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Certificate _previewFor(CertificateLevel level) {
    return Certificate(
      learnerName: "John Doe",
      courseName: "Python Mastery",
      level: level,
      averageScore: switch (level) {
        CertificateLevel.bronze => 78,
        CertificateLevel.silver => 90,
        CertificateLevel.gold => 98,
      },
      quizzesPassed: switch (level) {
        CertificateLevel.bronze => 32,
        CertificateLevel.silver => 46,
        CertificateLevel.gold => 60,
      },
      totalQuizzes: 60,
      topicsCompleted: switch (level) {
        CertificateLevel.bronze => 18,
        CertificateLevel.silver => 24,
        CertificateLevel.gold => 30,
      },
      totalTopics: 30,
      issuedDate: DateTime.now(),
      certificateId: "PENDING",
      organizationName: "PYTHON LEARNING PLATFORM",
      directorName: "Python Learning Platform",
      directorTitle: "Course Director",
      verificationUrl: "",
      finalScore: null,
      isVerified: _isEligible && level == _earnedLevel,
      isPreview: !_isEligible || level != _earnedLevel,
    );
  }
}