import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/models/certificate.dart';
import 'package:python_quiz/services/certificate_service.dart';
import 'package:python_quiz/services/completed_service.dart';
import 'package:python_quiz/services/quiz_progress_service.dart';
import 'package:python_quiz/widgets/certificate/certificate_progress_card.dart';
import 'package:python_quiz/widgets/certificate/certificate_requirement_card.dart';
import 'package:python_quiz/widgets/certificate/certificate_reward_card.dart';
import 'package:python_quiz/widgets/certificate/certificate_preview_card.dart';

import 'certificate_preview_screen.dart';

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

  int _completedTopics = 0;

  int _passedQuizzes = 0;

  double _averageScore = 0;

  CertificateLevel? _certificateLevel;

  Certificate? _certificate;

  @override
  void initState() {
    super.initState();
    _loadCertificateProgress();
  }

  Future<void> _loadCertificateProgress() async {

    final completedTopics =
    await CompletedService.getCompletedTopics();

    final passedQuizzes =
    await QuizProgressService.getPassedQuizCount();

    final average =
    await CertificateService.getAverageScore();

    final eligible =
    await CertificateService.isEligible();

    final level =
    await CertificateService.getCertificateLevel();

    Certificate? certificate;

    certificate = eligible
        ? await CertificateService.generateCertificate(
      learnerName: "Arun Bhardwaj",
    )
        : await CertificateService.generatePreviewCertificate(
      learnerName: "Arun Bhardwaj",
    );

    if (!mounted) return;

    setState(() {
      _completedTopics = completedTopics.length;
      _passedQuizzes = passedQuizzes;
      _averageScore = average;
      _isEligible = eligible;
      _certificateLevel = level;
      _certificate = certificate;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                        CertificateProgressCard(
                          completedTopics: _completedTopics,
                          totalTopics: CertificateService.totalTopics,
                          passedQuizzes: _passedQuizzes,
                          averageScore: _averageScore,
                          level:
                          _certificateLevel ??
                              CertificateLevel.bronze,
                          isEligible: _isEligible,
                        ),

                        CertificateRequirementCard(
                          allTopicsCompleted:
                          _completedTopics ==
                              CertificateService.totalTopics,

                          allQuizzesPassed:
                          _passedQuizzes ==
                              CertificateService.totalTopics,

                          averageScore: _averageScore,
                        ),
                        CertificateRewardCard(
                          currentLevel:
                          _certificateLevel ??
                              CertificateLevel.bronze,
                        ),

                        CertificatePreviewCard(
                          level: _certificateLevel ?? CertificateLevel.bronze,
                          isEligible: _isEligible,
                          onPreview: () {
                            if (_certificate == null) return;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CertificatePreviewScreen(
                                  certificate: _certificate!,
                                ),
                              ),
                            );
                          },
                        ),
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
}