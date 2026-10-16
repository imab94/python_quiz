
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
    try {
      final eligible = await CertificateService.isEligible();
      final average = await CertificateService.getAverageScore();

      final level = average >= 95.0
          ? CertificateLevel.gold
          : average >= 85.0
          ? CertificateLevel.silver
          : average >= 70.0
          ? CertificateLevel.bronze
          : null;

      final certificate = await CertificateService.generateCertificate(
        learnerName: 'Python Learner',
      );

      if (!mounted) return;

      setState(() {
        _isEligible = eligible;

        // Earned tier depends on score AND overall course eligibility.
        _earnedLevel = eligible && level != null
            ? level
            : CertificateLevel.bronze;

        // Always start on Bronze, without preventing tier selection.
        _selectedLevel = CertificateLevel.bronze;

        _certificate = certificate;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isEligible = false;
        _earnedLevel = CertificateLevel.bronze;
        _selectedLevel = CertificateLevel.bronze;
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to load certificate progress. Please try again.',
          ),
        ),
      );
    }
  }



  Future<String?> _showExportFormatDialog() async {
    return showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Download Certificate'),
          content: const Text('Choose your preferred format.'),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, 'png'),
              child: const Text('PNG Image'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, 'pdf'),
              child: const Text('PDF Document'),
            ),
          ],
        );
      },
    );
  }


  double get _requiredScore {
    return switch (_selectedLevel) {
      CertificateLevel.bronze => 70.0,
      CertificateLevel.silver => 85.0,
      CertificateLevel.gold => 95.0,
    };
  }

  bool get _canDownloadSelectedCertificate {
    return _isEligible &&
        _selectedLevel.index <= _earnedLevel.index;
  }

  @override
  Widget build(BuildContext context) {
    final baseCertificate =
        _certificate ?? _previewFor(_selectedLevel);

    final canDownload = _canDownloadSelectedCertificate;

    final certificate = baseCertificate.copyWith(
      level: _selectedLevel,
      isVerified: canDownload,
      isPreview: !canDownload,
      finalScore: canDownload ? baseCertificate.averageScore : null,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      splashRadius: 22,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Python Certification',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Become a Certified Python Developer',
                            style: GoogleFonts.lato(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Show certificate information dialog.
                      },
                      splashRadius: 22,
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Body
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
                            // All tiers remain selectable for preview.
                            setState(() {
                              _selectedLevel = level;
                            });
                          },
                        ),

                        const SizedBox(height: 14),

                        // Certificate Preview
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 900,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: AnimatedScale(
                                scale: 1,
                                duration: const Duration(
                                  milliseconds: 250,
                                ),
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

                        // Status + Generate
                        CertificateGenerateCard(
                          topicsCompleted:
                          certificate.topicsCompleted,
                          totalTopics: certificate.totalTopics,
                          quizzesPassed: certificate.quizzesPassed,
                          totalQuizzes: certificate.totalQuizzes,
                          averageScore: certificate.averageScore,
                          isVerified: canDownload,
                          requiredScore: _requiredScore,

                          onGenerate: () async {
                            // Recheck requirements immediately before export.
                            try {
                              final eligible = await CertificateService.isEligible();
                              final currentScore = await CertificateService.getAverageScore();

                              if (!mounted) return;

                              final currentEarnedLevel = currentScore >= 95.0
                                  ? CertificateLevel.gold
                                  : currentScore >= 85.0
                                  ? CertificateLevel.silver
                                  : currentScore >= 70.0
                                  ? CertificateLevel.bronze
                                  : null;

                              final canDownloadNow = eligible &&
                                  currentEarnedLevel != null &&
                                  _selectedLevel.index <= currentEarnedLevel.index &&
                                  currentScore >= _requiredScore &&
                                  currentScore <= 100.0;

                              if (!canDownloadNow) {
                                await _loadCertificateProgress();

                                if (!mounted) return;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Complete all topics, pass all quizzes, and score at least '
                                          '${_requiredScore.toStringAsFixed(0)}% '
                                          'to download this certificate.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              if (_certificateKey.currentContext == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Certificate preview is not ready. Please try again.'),
                                  ),
                                );
                                return;
                              }

                              // Ask the user to choose the export format.
                              final format = await _showExportFormatDialog();

                              if (!mounted || format == null) return;

                              if (format != 'png' && format != 'pdf') return;

                              if (format == 'png') {
                                final success = await CertificateExportService.exportImage(
                                  repaintKey: _certificateKey,
                                  certificate: certificate,
                                );

                                if (!mounted) return;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      success
                                          ? '🎉 Certificate saved to your gallery.'
                                          : '❌ Failed to save certificate. Please try again.',
                                    ),
                                  ),
                                );
                              } else {
                                // exportPdf() creates the PDF and opens the print/share layout.
                                await CertificateExportService.exportPdf(
                                  repaintKey: _certificateKey,
                                  certificate: certificate,
                                );

                                if (!mounted) return;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      '🎉 PDF export opened. Save or share your certificate from the dialog.',
                                    ),
                                  ),
                                );
                              }
                            } catch (e, stackTrace) {
                              debugPrintStack(stackTrace: stackTrace);

                              if (!mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Unable to generate certificate. Please try again.',
                                  ),
                                ),
                              );
                            }
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
      learnerName: 'Python Learner',
      courseName: 'Python Mastery',
      level: level,
      averageScore: 0,
      quizzesPassed: 0,
      totalQuizzes: CertificateService.totalTopics,
      topicsCompleted: 0,
      totalTopics: CertificateService.totalTopics,
      issuedDate: DateTime.now(),
      certificateId: 'PENDING',
      organizationName: 'PYTHON LEARNING PLATFORM',
      directorName: 'Python Learning Platform',
      directorTitle: 'Course Director',
      verificationUrl: '',
      finalScore: null,
      isVerified: false,
      isPreview: true,
    );
  }
}
