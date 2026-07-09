enum ReminderFrequency {
  daily,
  weekdays,
  everyTwoDays,
  weekly,
}

extension ReminderFrequencyExtension on ReminderFrequency {

  String get title {
    switch (this) {

      case ReminderFrequency.daily:
        return "Every Day";

      case ReminderFrequency.weekdays:
        return "Weekdays Only";

      case ReminderFrequency.everyTwoDays:
        return "Every 2 Days";

      case ReminderFrequency.weekly:
        return "Weekly";
    }
  }
}