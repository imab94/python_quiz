import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/user_profile.dart';
import 'package:python_quiz/services/profile_service.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:url_launcher/url_launcher.dart';

enum FeedbackType { bug, feature, suggestion, compliment }

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  UserProfile? _profile;

  bool _loading = true;

  bool _submitting = false;

  FeedbackType _feedbackType = FeedbackType.suggestion;

  final TextEditingController _feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    final profile = await ProfileService.getProfile();

    if (!mounted) return;

    setState(() {
      _profile = profile;
      _loading = false;
    });
  }

  Future<void> _submitFeedback() async {
    final feedback = _feedbackController.text.trim();

    if (feedback.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter at least 10 characters.")),
      );

      return;
    }

    setState(() {
      _submitting = true;
    });

    final subject = "[$_feedbackTitle] Python Learning Platform";

    final body = '''
      Feedback Type: $_feedbackTitle
      
      Message
      ------------------------------------------------
      
      $feedback
      
      ------------------------------------------------
      
      Sent by:
      ${_profile?.name ?? "Python Learner"}
''';

    final email = Uri.parse(
      'mailto:learning.pythonplatform@gmail.com'
          '?subject=${Uri.encodeComponent(subject)}'
          '&body=${Uri.encodeComponent(body)}',
    );

    try {
      final launched = await launchUrl(
        email,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        throw Exception("Unable to open email app.");
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    if (mounted) {
      setState(() {
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
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
                      "Send Feedback",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white12, height: 1),

              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "We'd love to hear from you!",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "Help us improve Python Learning Platform by sharing your suggestions, reporting bugs, or telling us what you'd like to see next.",
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 15,
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 28),

                            Text(
                              "Learner",
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .05),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.deepPurpleAccent,
                                    child: Text(
                                      (_profile?.name ?? "P")[0].toUpperCase(),
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _profile?.name ?? "Python Learner",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),

                                        const SizedBox(height: 4),

                                        Text(
                                          "Python Learner",
                                          style: GoogleFonts.lato(
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            Text(
                              "Feedback Type",
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .05),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<FeedbackType>(
                                  value: _feedbackType,
                                  dropdownColor: const Color(0xFF4B1BB5),
                                  iconEnabledColor: Colors.white,

                                  isExpanded: true,

                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),

                                  items: [
                                    DropdownMenuItem(
                                      value: FeedbackType.bug,
                                      child: Text("🐞 Bug Report"),
                                    ),

                                    DropdownMenuItem(
                                      value: FeedbackType.feature,
                                      child: Text("💡 Feature Request"),
                                    ),

                                    DropdownMenuItem(
                                      value: FeedbackType.suggestion,
                                      child: Text("📝 Suggestion"),
                                    ),

                                    DropdownMenuItem(
                                      value: FeedbackType.compliment,
                                      child: Text("❤️ Compliment"),
                                    ),
                                  ],

                                  onChanged: (value) {
                                    if (value == null) return;

                                    setState(() {
                                      _feedbackType = value;
                                    });
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            Text(
                              "Your Feedback",
                              style: GoogleFonts.lato(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .05),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: TextField(
                                controller: _feedbackController,

                                maxLength: 1000,

                                minLines: 10,

                                maxLines: 12,

                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),

                                decoration: InputDecoration(
                                  counterText: "",

                                  hintText:
                                      "Tell us what you liked, what didn't work, or what you'd love to see in future updates...",

                                  hintStyle: GoogleFonts.lato(
                                    color: Colors.white38,
                                    height: 1.6,
                                  ),

                                  contentPadding: const EdgeInsets.all(20),

                                  border: InputBorder.none,
                                ),

                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${_feedbackController.text.length} / 1000",
                                style: GoogleFonts.lato(
                                  color: _feedbackController.text.length >= 950
                                      ? Colors.redAccent
                                      : _feedbackController.text.length >= 800
                                      ? Colors.amber
                                      : Colors.white54,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF8E2DE2),
                                      Color(0xFF6A11CB),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.withValues(
                                        alpha: .35,
                                      ),
                                      blurRadius: 14,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: _submitting
                                      ? null
                                      : _submitFeedback,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  icon: _submitting
                                      ? const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.send_rounded,
                                          color: Colors.white,
                                        ),
                                  label: Text(
                                    _submitting
                                        ? "Submitting..."
                                        : "Submit Feedback",
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 18),

                            Center(
                              child: Text(
                                "Thank you for helping us improve Python Learning Platform ❤️",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  color: Colors.white54,
                                  fontSize: 13,
                                  height: 1.5,
                                ),
                              ),
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

  String get _feedbackTitle {
    switch (_feedbackType) {
      case FeedbackType.bug:
        return "Bug Report";

      case FeedbackType.feature:
        return "Feature Request";

      case FeedbackType.suggestion:
        return "Suggestion";

      case FeedbackType.compliment:
        return "Compliment";
    }
  }
}
