import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:python_quiz/models/reminder_frequency.dart';

class ReminderSettingsService {
  static const _dailyReminderKey = "daily_reminder_enabled";
  static const _reminderHourKey = "reminder_hour";
  static const _reminderMinuteKey = "reminder_minute";
  static const _frequencyKey = "reminder_frequency";

  // Daily Reminder
  static Future<bool> isDailyReminderEnabled() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_dailyReminderKey) ?? true;
  }

  // Get Remainer Time
  static Future<TimeOfDay> getReminderTime() async {
    final prefs = await SharedPreferences.getInstance();

    final hour = prefs.getInt(_reminderHourKey) ?? 20;
    final minute = prefs.getInt(_reminderMinuteKey) ?? 0;

    return TimeOfDay(
      hour: hour,
      minute: minute,
    );
  }

  // Set Remainer
  static Future<void> setReminderTime(
      TimeOfDay time,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(
      _reminderHourKey,
      time.hour,
    );

    await prefs.setInt(
      _reminderMinuteKey,
      time.minute,
    );
  }

  // Set Daily Remainer Time
  static Future<void> setDailyReminderEnabled(
      bool enabled,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      _dailyReminderKey,
      enabled,
    );
  }

  static Future<ReminderFrequency> getReminderFrequency() async {

    final prefs = await SharedPreferences.getInstance();

    final index =
        prefs.getInt(_frequencyKey) ?? 0;

    return ReminderFrequency.values[index];
  }

  static Future<void> setReminderFrequency(
      ReminderFrequency frequency,
      ) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(
      _frequencyKey,
      frequency.index,
    );
  }
}