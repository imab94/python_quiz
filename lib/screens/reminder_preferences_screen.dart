import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/models/reminder_frequency.dart';
import '../services/reminder_settings_service.dart';

class ReminderPreferencesScreen extends StatefulWidget {
  const ReminderPreferencesScreen({super.key});

  @override
  State<ReminderPreferencesScreen> createState() =>
      _ReminderPreferencesScreenState();
}

class _ReminderPreferencesScreenState extends State<ReminderPreferencesScreen> {
  bool _dailyReminderEnabled = true;
  TimeOfDay _reminderTime = const TimeOfDay(hour: 20, minute: 0);
  ReminderFrequency _frequency = ReminderFrequency.daily;
  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final enabled = await ReminderSettingsService.isDailyReminderEnabled();
    final reminderTime = await ReminderSettingsService.getReminderTime();
    final frequency = await ReminderSettingsService.getReminderFrequency();
    if (!mounted) return;

    setState(() {
      _dailyReminderEnabled = enabled;
      _reminderTime = reminderTime;
      _frequency = frequency;
    });
  }

  Future<void> _selectReminderTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );

    if (picked == null) return;

    await ReminderSettingsService.setReminderTime(picked);

    if (!mounted) return;

    setState(() {
      _reminderTime = picked;
    });
  }

  Future<void> _selectFrequency() async {
    final selected = await showModalBottomSheet<ReminderFrequency>(
      context: context,
      backgroundColor: const Color(0xFF252B42),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ReminderFrequency.values.map((frequency) {
              return ListTile(
                title: Text(
                  frequency.title,
                  style: const TextStyle(color: Colors.white),
                ),

                trailing: frequency == _frequency
                    ? const Icon(Icons.check, color: Colors.amber)
                    : null,

                onTap: () {
                  Navigator.pop(context, frequency);
                },
              );
            }).toList(),
          ),
        );
      },
    );

    if (selected == null) return;

    await ReminderSettingsService.setReminderFrequency(selected);

    if (!mounted) return;

    setState(() {
      _frequency = selected;
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
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
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
                      "Learning Reminders",
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
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [

                    // ==========================
                    // Daily Reminder
                    // ==========================

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .05),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Row(
                        children: [

                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.amber.withValues(alpha: .15),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.notifications_active_rounded,
                              color: Colors.amber,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Daily Learning Reminder",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  "Receive a daily reminder to continue learning Python.",
                                  style: GoogleFonts.lato(
                                    color: Colors.white60,
                                    fontSize: 13,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Switch(
                            value: _dailyReminderEnabled,
                            activeThumbColor: Colors.amber,
                            onChanged: (value) async {
                              setState(() {
                                _dailyReminderEnabled = value;
                              });
                              await ReminderSettingsService
                                  .setDailyReminderEnabled(value);
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ==========================
                    // Reminder Time
                    // ==========================

                    InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: _dailyReminderEnabled
                          ? _selectReminderTime
                          : null,
                      child: Opacity(
                        opacity: _dailyReminderEnabled ? 1 : .45,
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .05),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white12),
                          ),
                          child: Row(
                            children: [

                              const Icon(
                                Icons.schedule_rounded,
                                color: Colors.lightBlueAccent,
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "Reminder Time",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      _reminderTime.format(context),
                                      style: GoogleFonts.lato(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.edit_rounded,
                                    size: 22,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white54,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ==========================
                    // Reminder Frequency
                    // ==========================

                    InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: _dailyReminderEnabled
                          ? _selectFrequency
                          : null,
                      child: Opacity(
                        opacity: _dailyReminderEnabled ? 1 : .45,
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .05),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white12),
                          ),
                          child: Row(
                            children: [

                              const Icon(
                                Icons.repeat_rounded,
                                color: Colors.greenAccent,
                              ),

                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "Reminder Frequency",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      _frequency.title,
                                      style: GoogleFonts.lato(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                        ),
                      ),
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
